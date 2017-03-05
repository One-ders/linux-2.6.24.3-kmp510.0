#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/types.h>
#include <linux/slab.h>
#include <linux/i2c.h>
#include <linux/delay.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/miscdevice.h>
#include <linux/ioctl.h>
#include <linux/pm.h>
#include <linux/pm_legacy.h>

#include <asm/bitops.h>

#include <asm-mips/mach-jz4750d/jz4750d.h>

#define FM_RDA580X_VER  "1.0.0"
#define FM_RDA580X_NAME "fm"

static unsigned short normal_i2c[] = { 0x10, I2C_CLIENT_END };
I2C_CLIENT_INSMOD;

typedef void (*WQ_HANDLER)(void);

struct FM_DATA {
	struct workqueue_struct *wqp;		// 0
	struct work_struct	work;		// 4
	unsigned char pad0[168];		// 20
	struct i2c_client *client;		// 188
	struct pm_dev	  *pm_dev;		// 192
	unsigned char b196;			// 196
	unsigned char b197;			// 197
	unsigned char b198;			// 198
	unsigned char b199;			// 199
	unsigned char b200;			// 200
	unsigned char pad2[1];			// 201
	unsigned short int freq;		// 202
	unsigned char pad3[4];			// 204
	unsigned short wbuf[8];			// 208
	unsigned short rbuf[8];			// 224
};

static struct i2c_driver fm_rda580x_driver;
static struct FM_DATA *fm_data;
static unsigned long fm_opened;

static int rda580x_reg_write(struct FM_DATA *fm_data, int xx, unsigned char len) {
	struct i2c_msg msg;
	unsigned char mbuf[10];
	struct i2c_client *client;
	int rc;

	if (len) {
		int i;
		unsigned short *hwp;
		hwp=fm_data->wbuf;
		for(i=0;i<len;i++) {
			unsigned short hw=hwp[i];
			mbuf[i*2]=hw>>8;
			mbuf[(i*2)+1]=hw&0xff;
		}
	}
	
	client=fm_data->client;

	msg.addr=client->addr;
	msg.flags=(client->flags & I2C_M_TEN);
	msg.len=len*2;
	msg.buf=mbuf;
	rc=i2c_transfer(client->adapter, &msg, 1);
	if (rc!=1) {
		printk("<3>FM_RDA580X %s: error\n", __FUNCTION__);
		return -1;
	}
	return 0;
}

static int rda580x_reg_read(struct FM_DATA *fm_data, int xx, int len) {
	struct i2c_client *client=fm_data->client;
	struct i2c_msg msg;
	unsigned char mbuf[10];
	int rc;

	len&=0xff;
	if (len>16) {
		len=16;
	}
	len=len-9;
	len=len*2;

	msg.addr=client->addr;
	msg.flags=(client->flags&I2C_M_TEN)|I2C_M_RD;
	msg.len=len;
	msg.buf=mbuf;

	rc=i2c_transfer(client->adapter, &msg, 1);
//	rc=(rc==1)?len:rc;
	if (rc<0) {
		printk("<3>FM_RDA580X %s: error\n", __FUNCTION__);
		rc=-1;
	}
	if (len>0) {
		int i;
		for(i=0;i<len;i++) {
			unsigned char b0,b1;
			
			b0=mbuf[i*2];
			b1=mbuf[(i*2)+1];
		
			fm_data->rbuf[i]=(b0<<8)|b1;
		}
	}

	return rc;
}

static int fm_powerup(struct FM_DATA *fm_data) {
	unsigned short regData=fm_data->wbuf[0];
	
	if (!(regData&0x1)) {
		fm_data->wbuf[0]|=3;	
		rda580x_reg_write(fm_data,2,2);
		fm_data->wbuf[0]&=0xfffd;
		rda580x_reg_write(fm_data,2,2);
		msleep(110);
	} 

	rda580x_reg_read(fm_data,10,16);
	
	return 0;
}

static void fm_regional_cfg(struct FM_DATA *fm_data, int region) {
	unsigned short w0;
	unsigned short w1;
	unsigned short w2;

	w0=fm_data->wbuf[0];
	w1=fm_data->wbuf[1];
	w2=fm_data->wbuf[2];

	w0&=0xfff7;	// zero out bit 0
	w1&=0xfff0;	// zero out bit 3,2,1,0
	w2&=0xf7ff;	// zero out bit 11

	fm_data->wbuf[0]=w0;
	fm_data->wbuf[1]=w1;
	fm_data->wbuf[2]=w2;

	switch(region) {
		case 0: {
			fm_data->wbuf[0]=w0|0x8;
			fm_data->wbuf[1]=w1|0x1;
			break;
		}
		case 1: {
			fm_data->wbuf[0]=w0|0x8;
			fm_data->wbuf[2]=w2|0x800;
			break;
		}
		case 2: {
			fm_data->wbuf[1]=w1|0x4;
			fm_data->wbuf[2]=w2|0x800;
			break;
		}
		case 3: {
			fm_data->wbuf[1]=w1|0x8;
			fm_data->wbuf[2]=w2|0x800;
			break;
		}
		case 4: {
			fm_data->wbuf[0]=w0|0x8;
			fm_data->wbuf[1]=w1|0xc;
			fm_data->wbuf[2]=w2|0x800;
			break;
		}
		default: {
			fm_data->wbuf[0]=w0|0x8;
			fm_data->wbuf[1]=w1|0xa;
			fm_data->wbuf[2]=w2|0x800;
			break;
		}

	}
	return;
}

static int fm_set_volume(struct FM_DATA *fm_data, unsigned char vol) {
	unsigned short int wreg3;
	unsigned short int wreg0;
	printk("<6>FM_RDA580X: volume = %d\n", vol);
	vol=vol/2;

	wreg3=fm_data->wbuf[3]&0xfff0;
	if (vol>=16) {
		vol=15;
	}
	
	wreg0=fm_data->wbuf[0]&0xbfff;
	wreg3=wreg3|vol;
	wreg0=wreg0|0x4000;

	fm_data->wbuf[0]=wreg0;
	fm_data->wbuf[3]=wreg3;

	return rda580x_reg_write(fm_data,2,5);
}

static int fm_get_volume(struct FM_DATA *fm_data) {
	return ((fm_data->wbuf[3]&0xf)<<1);
}

static int fm_get_frequency(struct FM_DATA *fm_data) {
	unsigned short int wreg3=fm_data->wbuf[1];
	unsigned short int rreg10=fm_data->rbuf[0];
	unsigned short int a0, a1;
static unsigned char bb[] = {0x0a, 0x10, 0x05};

	if ((wreg3&0x3)==0x3) { // l1
		return 0;
	}

	a1=8700;
	if (wreg3&0xc) { // l2
		if ((wreg3&0xc)==0xc) {
			a1=6500;
		} else {
			a1=7600;
		}
	}

	a0=bb[wreg3&0x3];
	rreg10=rreg10&0x3ff;
	a0=rreg10*a0;
	a0=a0+a1;
	a0=a0&0xffff;

	printk("get_freq: return %d\n", a0);
	return a0;
}

static int fm_tune(struct FM_DATA *fm_data, unsigned short freq) {
static unsigned char bb[] = {0x0a, 0x14, 0x05};
	unsigned short int 	wreg3;
	unsigned short int	a0;
	short int 		a1;
	unsigned short int 	v0;
	unsigned short int	t2;
	int			loop;

	printk("fm_tune: tune to %d\n", freq);
	if (freq>=7600) {//l1
		wreg3=fm_data->wbuf[1];
		if ((wreg3&0x3)==0x3) {//l6
			a1=0;
			goto l11;
		} else if (!(wreg3&0xc)) {//l7
			v0=8700;
			t2=8700;
l9:

			a0=bb[wreg3&0x3];
			if (v0<freq) {
				v0=freq;
			}
			v0=v0-t2;
			v0=v0/a0;
			v0=v0<<0x6;
			a1=v0<<0x10;
			a1=a1>>0x10;
			goto l11;
		} else if ((wreg3&0xc)==0xc) { //l8
			v0=6500;	
			t2=6500;
			goto l9;
		} else {
			v0=7600;
			t2=7600;
			goto l9;
		}
	} else {
		v0=freq<<0x6;
		a1=v0<<0x10;
		a1=a1>>0x10;
		wreg3=fm_data->wbuf[1];
	}

l11:
	v0=wreg3&0x2f;
	v0=v0|0x10;
	v0=a1|v0;
	fm_data->wbuf[1]=v0;

	rda580x_reg_write(fm_data,3,3);

	loop=500;
	while(loop--) {
		msleep(1);
		rda580x_reg_read(fm_data,10,10);
		if (fm_data->rbuf[0]&0x4000) {
			break;
		}
	}

	if (!loop) {
		printk("<3>FM_RDA580X %s: Wait STC high timeout\n", __FUNCTION__);
	}

//l10
	fm_data->wbuf[1]&=0xffef;
	rda580x_reg_write(fm_data,3,3);
	
	msleep(10);

	return (rda580x_reg_read(fm_data,10,11));
}

static int fm_get_rssi(struct FM_DATA *fm_data) {

	rda580x_reg_read(fm_data,10,11);
	return (fm_data->rbuf[1]>>9);
}

static int is_fm_rds_available(struct FM_DATA *fm_data) {
	return ((fm_data->rbuf[0]>>0xc)&0x1);
}

static int is_fm_stereo(struct FM_DATA *fm_data) {
	return ((fm_data->rbuf[0]>>0xa)&0x1);
}

static int is_fm_powerup(struct FM_DATA *fm_data) {
	return (fm_data->wbuf[0]&0x1);
}

static int is_fm_muted(struct FM_DATA *fm_data) {
	return (((fm_data->wbuf[0]>>0xe)^0x1)&0x1);
}



static void fm_seek_wqueue_handler(struct work_struct *work) {
	unsigned short wreg2=fm_data->wbuf[0];
	unsigned short rreg10;
	unsigned short int freq;
	unsigned int v0;

	printk("%s\n", __FUNCTION__);

	wreg2&=0xfd7f;
	fm_data->b199=0;
	if (fm_data->b197) {
		wreg2|=0x80;
	}

	if (fm_data->b196) {
		wreg2|=0x200;
	}

	wreg2|=0x100;
	fm_data->wbuf[0]=wreg2;

	rda580x_reg_write(fm_data,2,2);

l4:
	msleep(0);

	rda580x_reg_read(fm_data,10,11);

	freq=fm_get_frequency(fm_data);

	fm_data->freq=freq;
	rreg10=fm_data->rbuf[0];

	if(rreg10&0x4000) { // l3
		v0=rreg10&0x2000;
		if (!fm_data->b198) {
			goto l6;
		}
		v0=v0>>0xd;
		fm_data->b200=v0;
		goto l6;
	}

	if(fm_data->b198) {
		goto l4;	
	}

l6:
	wreg2=fm_data->wbuf[0];
	wreg2&=0xfeff;
	fm_data->wbuf[0]=wreg2;

	rda580x_reg_write(fm_data,2,2);

	msleep(10);

	rda580x_reg_read(fm_data,10,11);

	freq=fm_get_frequency(fm_data);
	fm_data->freq=freq;
	fm_data->b199=1;
	fm_data->b198=0;
}

static ssize_t fm_rda580x_read(struct file *f, 
			char *buf, size_t len, loff_t *offs) {
	printk("%s\n",__FUNCTION__);
	return -1;
}

static ssize_t fm_rda580x_write(struct file *f, 
			const char *buf, size_t len, loff_t *off) {
	printk("%s\n", __FUNCTION__);
	return -1;
}

#define FM_IOCTL_STATUS		0
#define FM_IOCTL_SET_VOL	2
#define FM_IOCTL_TUNE		3
#define FM_IOCTL_SEEK_UP	4


struct fm_status {
	unsigned short int freq;
	unsigned char rssi; //b2
	unsigned char volume; //b3
	unsigned char flags; //b4
// b4.0 == freq updated
// b4.1 == is_stereo
// b4.2 == rds_avail
// b4.3 == is_muted 
// b4.7 == is_powered
//
	unsigned char b5;
	unsigned char b6;
	unsigned char b7;
};



static int fm_rda580x_ioctl(struct inode *i, struct file *f, 
			unsigned int cmd, unsigned long arg) {
	printk("%s: cmd %x, arg %lx\n", __FUNCTION__, cmd, arg);

	switch(cmd) {
		case FM_IOCTL_STATUS: {
			struct fm_status *fm_stat=(struct fm_status *)arg;
			if (!arg) {
				return 0;
			}
			if (fm_data->b199) { // idle
				if (!fm_data->b198) {	// not scanning
					fm_stat->flags&=0xfe;
					rda580x_reg_read(fm_data,10,11);
					fm_stat->freq=fm_get_frequency(fm_data);
				} else { //cmd0.1
					fm_stat->flags|=1;
					fm_stat->freq=fm_data->freq;
				}
			} else { //cmd0.1
				fm_stat->flags|=1;
				fm_stat->freq=fm_data->freq;
			}
//cmd0.3
			fm_stat->rssi=fm_get_rssi(fm_data);
			fm_stat->volume=fm_get_volume(fm_data);

			if (is_fm_rds_available(fm_data)) {
				fm_stat->flags|=4;
			} else { // cmd0.4
				fm_stat->flags&=0xfb;
			}

			if (is_fm_stereo(fm_data)) {
				fm_stat->flags|=2;
			} else { // cmd0.6
				fm_stat->flags&=0xfd;
			}
			
			if (is_fm_powerup(fm_data)) {
				fm_stat->flags|=0x80;
			} else {// cmd0.8
				fm_stat->flags&=0x7f;
			}

			if (is_fm_muted(fm_data)) {
				fm_stat->flags|=0x08;
			} else { // cmd0.10
				fm_stat->flags&=0xf7;
			}

			fm_stat->b5=88;
			fm_stat->b6=0;
			fm_stat->b7=0;

			return 0;

		}
		case FM_IOCTL_SET_VOL: {
			if (arg>30) {
				return -EINVAL;
			}
			fm_set_volume(fm_data,arg);
			return 0;
		}
		case FM_IOCTL_TUNE: {
			fm_tune(fm_data,arg);
			return 0;
		}
		case FM_IOCTL_SEEK_UP: {
			if (fm_data->b198) {
				return -EAGAIN;
			}
			fm_data->b196=(arg>>1)&0x1;
			fm_data->b197=arg&0x1;
			fm_data->b198=1;
			queue_work(fm_data->wqp, &fm_data->work);
			return 0;
		}
	}
	return -1;
}

static int fm_rda580x_open(struct inode *i, struct file *f) {
	printk("%s\n",__FUNCTION__);
	if (!fm_data->client) { // l1
		printk("<3>FM_RDA580X %s: No i2c client\n", __FUNCTION__);
		return -EIO;
	}

//	if (!(ul_4208&0x10000)) { // l2
//	}
	if (test_and_set_bit(0,&fm_opened)) {
		return -EACCES;
	}
	
	fm_powerup(fm_data);
	fm_tune(fm_data,fm_data->freq);
	return 0;
}

static int fm_rda580x_release(struct inode *i, struct file *f) {
	printk("%s\n",__FUNCTION__);

	if (!fm_data->client) { // l1
		printk("<3>FM_RDA580X %s: No i2c client\n", __FUNCTION__);
		return -EIO;
	}

	test_and_clear_bit(0,&fm_opened);
	
	return 0;
}

//========================================================================

static int fm_rda580x_probe(struct i2c_adapter *adapter, int address, int kind) {
	struct i2c_client *client;
	int rc;

	printk("<7>FM_RDA580X %s: Enter %s\n", __FUNCTION__, __FUNCTION__); 
	client=kzalloc(sizeof(struct i2c_client), GFP_KERNEL);
	if (!client) return -ENOMEM;

	strlcpy(client->name, FM_RDA580X_NAME, I2C_NAME_SIZE);
	client->addr=address;
	client->adapter=adapter;
	client->driver=&fm_rda580x_driver;

	rc=i2c_attach_client(client);
	if (rc) {
		kfree(client);
		printk("<3>FM_RDA580X %s: i2c_attach_client fail: %d\n",
					__FUNCTION__, rc);
		return rc;
	}
	
	fm_data->client=client;

	printk("<6>FM_RDA580X: %s attached at 0x%02x\n", 
				client->name, client->addr);

	return rc;

}

static int fm_rda580x_attach(struct i2c_adapter *adapter) {
	printk("%s\n",__FUNCTION__);
	return i2c_probe(adapter,&addr_data,fm_rda580x_probe);
}

static int detach_client(struct i2c_client *cl) {
	printk("%s\n",__FUNCTION__);
	return -1;
}

static int fm_rda580x_suspend(struct i2c_client *cl, pm_message_t mesg) {
	printk("%s\n",__FUNCTION__);
	return -1;
}

static int fm_rda580x_resume(struct i2c_client *cl) {
	printk("%s\n",__FUNCTION__);
	return -1;
}



static const struct file_operations rda580x_fops = {
	.read=fm_rda580x_read,
	.write=fm_rda580x_write,
	.ioctl=fm_rda580x_ioctl,
	.open=fm_rda580x_open,
	.release=fm_rda580x_release,
};

static struct miscdevice fm_rda580x_dev = {
	.minor	= 255,
	.name	= FM_RDA580X_NAME,
	.fops	= &rda580x_fops,
};

static struct i2c_driver fm_rda580x_driver = {
	.driver = {
		.name	= FM_RDA580X_NAME,
	},
	.attach_adapter = fm_rda580x_attach,
	.detach_client	= detach_client,
	.suspend	= fm_rda580x_suspend,
	.resume		= fm_rda580x_resume,
};

static int __init fm_rda580x_init(void) {
	unsigned int v0,v1,a0;
	int rc;
	struct workqueue_struct *wqp;
	struct pm_dev		*pm_dev;

	printk("<6>FM_RDA580X: driver ver %s\n", FM_RDA580X_VER);

	fm_data=kzalloc(sizeof(*fm_data),GFP_KERNEL);
	if (!fm_data) {
		printk("<3>FM_RDA580X %s: kzalloc fail\n", __FUNCTION__);
		return -ENOMEM;
	}
	fm_data->b199=1; //byte

	i2c_register_driver(0,&fm_rda580x_driver);

	if (!fm_data->client) {
		printk("<3>FM_RDA580X %s: FM Module not found\n",__FUNCTION__);
		rc=-ENODEV;
		goto err;
	}

	memset(&fm_data->pad3[0],0,34);
	
	rda580x_reg_write(fm_data,2,6);     // write 6 half words to reg 2

	fm_powerup(fm_data);

	v1=fm_data->wbuf[2]&0xffc0; //short 212
	v1=v1|0x16;
	v1=v1&0xffff;
	v1=v1&0xf9ff;
	v1=v1|0x600;
	v0=fm_data->wbuf[0]&0xff8f; //short 208
	a0=v0&0xffff;
	a0=a0&0x6fff;
	v0=0xffffd000;
	a0=a0|v0;
	v0=0x10aa;
	fm_data->wbuf[0]=a0; // short 208
	fm_data->wbuf[2]=v1; // short 212
	fm_data->wbuf[3]=v0; // short 214

	fm_regional_cfg(fm_data,3);

	rda580x_reg_write(fm_data,2,6);

	rc=misc_register(&fm_rda580x_dev);
	if (rc<0) {
		printk("<3>FM_RDA580X %s: Can't register misc device with minor %d\n",
				__FUNCTION__, 0x3d);
		rc=-EIO;
		goto err;
	}

	printk("<6>FM_RDA580X: misc dev got minor %i\n", fm_rda580x_dev.minor);

	fm_set_volume(fm_data,30);

	wqp=create_singlethread_workqueue("fm_rda580x_workqueue");
	fm_data->wqp=wqp;
	INIT_WORK(&fm_data->work, fm_seek_wqueue_handler);
	fm_data->freq=fm_get_frequency(fm_data); // 202

//	fm_data->d[202]=freq; //short

//	pm_dev=pm_register(PM_SYS_DEV,0,fm_rda580x_pm_callback);
//	fm_data->pm_dev=pm_dev;  // 192
//	if (pm_dev) {
//		pm_dev.12=&fm_data;
//	}

	return 0;

err:
	i2c_del_driver(&fm_rda580x_driver);
	if (fm_data) {
		kfree(fm_data);
	}
	return rc;
}

static void __exit grux(void) {
        printk("fm grux called\n");
}


MODULE_AUTHOR("The Reverser");
MODULE_DESCRIPTION("Reverse engineered driver for the fm_rda580x");
MODULE_LICENSE("GPL");

module_init(fm_rda580x_init);
module_exit(grux);
