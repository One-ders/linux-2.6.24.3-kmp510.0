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

#define REG0_CHIP_ID_MASK 0xff00

#define REG2		2
#define REG2_DHIZ	0x8000	// Disable HighZ output
#define REG2_DMUTE	0x4000	// Disable Mute
#define REG2_MONO	0x2000	// Force Mono
#define REG2_BASS	0x1000	// Bass boost
#define REG2_RCLK_NCALIBMODE 0x0800
#define REG2_RCL_DIRECT	0x0400	// Clock direct input
#define REG2_SEEKUP	0x0200	// Seek up
#define REG2_SEEK	0x0100	// Seek, result in STC
#define REG2_SKMODE	0x0080	// Seek dont wrap at edge freq
#define REG2_CLK_MODE_MASK 0x0070 // 
#define REG2_CLK_MODE_SHIFT(a)	(a<<4)
#define REG2_CLK_MODE_32_768Khz	CLK_MODE_SHIFT(0)
#define REG2_CLK_MODE_12MHz	CLK_MODE_SHIFT(1)
#define REG2_CLK_MODE_13MHz	CLK_MODE_SHIFT(2)
#define REG2_CLK_MODE_19_2MHz	CLK_MODE_SHIFT(3)
#define REG2_CLK_MODE_24MHz	CLK_MODE_SHIFT(5)
#define REG2_CLK_MODE_26MHz	CLK_MODE_SHIFT(6)
#define REG2_CLK_MODE_38_4MHz	CLK_MODE_SHIFT(7)
#define REG2_ENA_RDS	0x0008
#define REG2_NEW_METHOD	0x0004
#define REG2_SOFT_RESET 0x0002
#define REG2_ENABLE	0x0001

#define REG3			3
#define REG3_CHANNEL_MASK	0xffc0
#define REG3_CHANNEL_SHIFT	6
#define REG3_DIRECT_MODE	0x0020
#define REG3_TUNE		0x0010	// Auto clear 
#define REG3_BAND_MASK		0x000c
#define REG3_BAND_SHIFT		2
#define REG3_BAND(a)		(a<<REG3_BAND_SHIFT)
#define REG3_BAND_EU		REG3_BAND(0)
#define REG3_BAND_JP		REG3_BAND(1)
#define REG3_BAND_WW		REG3_BAND(2)
#define REG3_BAND_EEU		REG3_BAND(3)
#define REG3_SPACE_MASK		0x0003
#define REG3_SPACE_100KHZ	0
#define REG3_SPACE_200KHZ	1
#define REG3_SPACE_50KHZ	2
#define REG3_SPACE_25KHZ	3

#define REG4			4
#define REG4_RSVD_15		0x8000
#define REG4_RBDS		0x2000
#define REG4_RSVD_12_13		0x3000
#define REG4_DE			0x0800	// 0=75s, 1=50s
#define REG4_RSVD_10		0x0400
#define REG4_SOFTMUTE		0x0200
#define REG4_AFCD		0x0100  // afc disable

#define REG5			5
#define REG5_INT_MODE		0x8000 // ack irq by read 0x0c
#define REG5_RSVD_12_14		0x7000
#define REG5_SEEKTH_MASK	0x0f00
#define REG5_RSVD_4_5		0x0030
#define REG5_VOL_MASK		0x000f

#define REG6			6
#define REG6_RSVD_15		0x8000
#define REG6_OPEN_MODE_MASK	0x6000

#define REG7			7
#define REG7_RSVD_15		0x8000
#define REG7_TH_SOFRBLEND_MASK  0x7c00
#define REG7_65_50_MODE		0x0200
#define REG7_RSVD_8		0x0100
#define REG7_SEEK_TH_OLD_MASK	0x00fc
#define REG7_SOFTBLEND_EN	0x0002
#define REG7_FREQ_MODE		0x0001

#define REGA			10
#define REGA_RDSR		0x8000 // RDS Ready
#define REGA_STC		0x4000 // Seek/tune complete
#define REGA_SF			0x2000 // Seek fail
#define REGA_RDSS		0x1000 // RDS SYNCED
#define REGA_BLK_E		0x0800 //
#define REGA_STEREO		0x0400
#define REGA_READ_CHAN_MASK	0x03ff

#define REGB			11
#define REGB_RSSI_MASK		0xfe00
#define REGB_RSSI_SHIFT		9
#define REGB_FM_TRUE		0x0100
#define REGB_FM_READY		0x0080
#define REGB_RSVD_6_5		0x0060
#define REGB_ABCD_E		0x0010
#define REGB_BLERA_MASK		0x000c
#define REGB_BLERB_MASK		0x0003

#define REGC_RDSA		12
#define REGD_RDSB		13
#define REGE_RDSC		14
#define REGF_RDSD		15


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
	unsigned short regfile[0x3a];		// 208
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
		hwp=&fm_data->regfile[2];
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

static int rda580x_reg_read(struct FM_DATA *fm_data, 
				int xx, unsigned char len) {
	struct i2c_client *client=fm_data->client;
	struct i2c_msg msg;
	unsigned char mbuf[10];
	int rc;

	if (len>16) {
		len=16;
	}
	len=len-9;	// len = 1 if orig was 10
	len=len*2;	// len = 2 if orig was 10

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
		for(i=0;(i*2)<len;i++) {
			unsigned char b0,b1;
			
			b0=mbuf[i*2];
			b1=mbuf[(i*2)+1];
		
			fm_data->regfile[i+0xa]=(b0<<8)|b1;
		}
	}

	return rc;
}

static int fm_powerup(struct FM_DATA *fm_data) {
	unsigned short reg2=fm_data->regfile[REG2];
	
	if (!(reg2&REG2_ENABLE)) {
		fm_data->regfile[REG2]|=(REG2_ENABLE|REG2_SOFT_RESET);	
		rda580x_reg_write(fm_data,2,2);
		fm_data->regfile[REG2]&=~REG2_SOFT_RESET;
		rda580x_reg_write(fm_data,2,2);
		msleep(110);
	} 

	rda580x_reg_read(fm_data,10,16);
	
	return 0;
}

/* 
 * Region 0, Us
 * Region 1, Eu
 * Region 2, JP
 * Region 3, World
 * Region 4, EEU
 */

static void fm_regional_cfg(struct FM_DATA *fm_data, int region) {

	fm_data->regfile[2]&=
		(~REG2_ENA_RDS);      // 0xfff7;	// zero out bit 3
	fm_data->regfile[3]&=
		~(REG3_BAND_MASK|REG3_SPACE_MASK); //0xfff0; zero out bit 3,2,1,0
	fm_data->regfile[4]&=
		~(REG4_DE|REG4_AFCD); //0xf7ff;// zero out bit 11

	switch(region) {
		case 0: {
			fm_data->regfile[2]|=REG2_ENA_RDS;  //0x8;
			fm_data->regfile[3]|=REG3_SPACE_200KHZ; //0x1;
			break;
		}
		case 1: {
			fm_data->regfile[2]|=REG2_ENA_RDS; //0x8;
			fm_data->regfile[4]|=(REG4_DE|REG4_RBDS);   //0x800;
			break;
		}
		case 2: {
			fm_data->regfile[3]|=REG3_BAND_JP; //0x4;
			fm_data->regfile[4]|=REG4_DE;	   //0x800;
			break;
		}
		case 3: {
			fm_data->regfile[3]|=REG3_BAND_WW; //0x8;
			fm_data->regfile[4]|=REG4_DE;	   //0x800;
			break;
		}
		case 4: {
			fm_data->regfile[2]|=REG2_ENA_RDS; //0x8;
			fm_data->regfile[3]|=REG3_BAND_EEU;//0xc;
			fm_data->regfile[4]|=REG4_DE;	   //0x800;
			break;
		}
		default: {
			fm_data->regfile[2]|=REG2_ENA_RDS; //0x8;
			fm_data->regfile[3]|=(REG3_BAND_WW|REG3_SPACE_50KHZ);//0xa;
			fm_data->regfile[4]|=REG4_DE;	   // 0x800;
			break;
		}

	}
	return;
}

#if 0
wreg2=208
wreg3=210
wreg4=212
wreg5=214
#endif

static int fm_set_volume(struct FM_DATA *fm_data, unsigned char vol) {
	unsigned short int reg5;

	vol=vol/2;
	if (vol>15) {
		vol=15;
	}

	reg5=fm_data->regfile[5]&~(REG5_VOL_MASK);    //0xfff0;
	reg5|=vol;
	
	fm_data->regfile[2]|= REG2_DMUTE;      // 0x4000 
	fm_data->regfile[5]=reg5;

	return rda580x_reg_write(fm_data,2,5);
}

static int fm_get_volume(struct FM_DATA *fm_data) {
	return ((fm_data->regfile[5]&REG5_VOL_MASK)<<1);
}

static unsigned char bb[] = {0x0a, 0x14, 0x05};
static unsigned short int 
fm_get_frequency(struct FM_DATA *fm_data) {
	unsigned short int reg3=fm_data->regfile[3];
	unsigned short int reg10=fm_data->regfile[0xa];
	unsigned short int band_start_freq, channel_space,
				channel_no, freq;
	unsigned short int band;


	if ((reg3&REG3_SPACE_MASK)==REG3_SPACE_25KHZ) { // l1
		return 0;
	}

	band_start_freq=8700;
	if ((band=reg3&REG3_BAND_MASK)) { // l2
		band_start_freq=7600;
		if (band==REG3_BAND_EEU) {
			band_start_freq=6500;
		}
	}

	channel_space=bb[reg3&REG3_SPACE_MASK];
	channel_no=reg10&REGA_READ_CHAN_MASK;
	freq=band_start_freq+(channel_no*channel_space);
	return freq;
}

static int fm_tune(struct FM_DATA *fm_data, unsigned short freq) {
	unsigned short int 	reg3;
	int			loop;
	unsigned short int band_start_freq;
	unsigned short int channel_no;
	unsigned short int channel_space;

	reg3=fm_data->regfile[3];

	if ((reg3&REG3_SPACE_MASK)==REG3_SPACE_25KHZ) {//l6
		channel_no=0;
		goto l11;
	} else if ((reg3&REG3_SPACE_MASK)==REG3_SPACE_100KHZ) {//l7
		band_start_freq=8700;
	} else if ((reg3&REG3_BAND_MASK)==REG3_BAND_EEU) { //l8
		band_start_freq=6500;	
	} else {
		band_start_freq=7600;
	}

	if (freq<band_start_freq) {
		freq=band_start_freq;
	}
	channel_space=bb[reg3&REG3_SPACE_MASK];
	channel_no=(freq-band_start_freq)/channel_space;

l11:
	fm_data->regfile[3]=(channel_no<<REG3_CHANNEL_SHIFT) | 
				REG3_TUNE | 
				(reg3 & ~REG3_CHANNEL_MASK);

	rda580x_reg_write(fm_data,3,3);

	loop=500;
	while(loop--) {
		msleep(1);
		rda580x_reg_read(fm_data,10,10);
		if (fm_data->regfile[0xa]&REGA_STC) {
			break;
		}
	}

	if (!loop) {
		printk("<3>FM_RDA580X %s: Wait STC high timeout\n", __FUNCTION__);
	}

//l10
	fm_data->regfile[3]&=~(REG3_TUNE); //0xffef;
//	rda580x_reg_write(fm_data,3,3);  // only update regfile, real reg is auto cleared
	
	msleep(10);

	return (rda580x_reg_read(fm_data,10,11));
}

static int fm_get_rssi(struct FM_DATA *fm_data) {

	rda580x_reg_read(fm_data,10,11);
	return (fm_data->regfile[0xb]>>REGB_RSSI_SHIFT);
}

static int is_fm_rds_available(struct FM_DATA *fm_data) {
	printk("REGA_RDSS=%x, REGA_RDSR=%x\n", 
			fm_data->regfile[0xa]&REGA_RDSS,
			fm_data->regfile[0xa]&REGA_RDSR);
	return (fm_data->regfile[0xa]&REGA_RDSS)?1:0;
}

static int is_fm_stereo(struct FM_DATA *fm_data) {
	return (fm_data->regfile[0xa]&REGA_STEREO)?1:0;
}

static int is_fm_powerup(struct FM_DATA *fm_data) {
	return (fm_data->regfile[2]&REG2_ENABLE);
}

static int is_fm_muted(struct FM_DATA *fm_data) {
	return (fm_data->regfile[2]&REG2_DMUTE)?0:1;
}



static void fm_seek_wqueue_handler(struct work_struct *work) {
	unsigned short reg2=fm_data->regfile[2];
	unsigned short reg10;
	unsigned short int freq;
	unsigned int v0;

	reg2&=~(REG2_SKMODE| REG2_SEEKUP); 	//0xfd7f;
	fm_data->b199=0;
	if (fm_data->b197) {
		reg2|=REG2_SKMODE;		//0x80;
	}

	if (fm_data->b196) {
		reg2|=REG2_SEEKUP;		//0x200;	
	}

	reg2|=REG2_SEEK;			//0x100;
	fm_data->regfile[2]=reg2;

	rda580x_reg_write(fm_data,2,2);

	while(fm_data->b198) {	// seeking
		msleep(0);

		rda580x_reg_read(fm_data,10,11);

		fm_data->freq=fm_get_frequency(fm_data);
		reg10=fm_data->regfile[0xa];

		if(reg10&REGA_STC) { // l3
			v0=reg10&REGA_SF;
			if (!fm_data->b198) {
				goto l6;
			}
			if (reg10&REGA_SF) {
				fm_data->b200=1; // scann failed
			}
			goto l6;
		}

	}

l6:
	fm_data->regfile[2]&=~REG2_SEEK;

//	rda580x_reg_write(fm_data,2,2);

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
#define FM_IOCTL_SEEK		4
#define FM_IOCTL_STOP_SEEK	5
#define FM_IOCTL_SET_REGION	8


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
//	printk("%s: cmd %x, arg %lx\n", __FUNCTION__, cmd, arg);

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
					printk("ioctl_status: scanning\n");
					fm_stat->flags|=1;
					fm_stat->freq=fm_data->freq;
				}
			} else { //cmd0.1
				printk("ioctl_status: not idle\n");
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
		case FM_IOCTL_SEEK: {
			if (fm_data->b198) {
				return -EAGAIN;
			}
			fm_data->b196=(arg>>1)&0x1; // down/up
			fm_data->b197=arg&0x1;
			fm_data->b198=1;
			queue_work(fm_data->wqp, &fm_data->work);
			return 0;
		}
		case FM_IOCTL_STOP_SEEK: {
			int i=50;
			fm_data->b198=0; // stop seek
			while(i--) {
				if (fm_data->b199) return 0;
				msleep(10);
			}
			printk("<3>FM_RDA580X %s: Cannot stop fm seeking\n", 
				__FUNCTION__);
			return -EIO;
		}
		case FM_IOCTL_SET_REGION: {
			fm_regional_cfg(fm_data, arg);
			rda580x_reg_write(fm_data,2,5);
			return 0;
		}
	}
	return -1;
}

static int fm_rda580x_open(struct inode *i, struct file *f) {

	if (!fm_data->client) { // l1
		printk("<3>FM_RDA580X %s: No i2c client\n", __FUNCTION__);
		return -EIO;
	}

	if (test_and_set_bit(0,&fm_opened)) {
		return -EACCES;
	}
	
	fm_powerup(fm_data);
	fm_tune(fm_data,fm_data->freq);
	return 0;
}

static int fm_rda580x_release(struct inode *i, struct file *f) {

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
	return i2c_probe(adapter,&addr_data,fm_rda580x_probe);
}

static int detach_client(struct i2c_client *cl) {
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
	fm_data->b199=1; // idle

	i2c_register_driver(0,&fm_rda580x_driver);

	if (!fm_data->client) {
		printk("<3>FM_RDA580X %s: FM Module not found\n",__FUNCTION__);
		rc=-ENODEV;
		goto err;
	}

	memset(&fm_data->pad3[0],0,34);
	
	rda580x_reg_write(fm_data,2,6);     // write reg 2 to 6 half words

	fm_powerup(fm_data);

	v1=fm_data->regfile[4]&0xffc0; //short 212
	v1=v1|0x16;
	v1=v1&0xf9ff;
	v1=v1|0x600;
	v1=v1|0x3000;
	a0=fm_data->regfile[2]& ~(REG2_CLK_MODE_MASK); //0xff8f; //short 208 bit 4-6 off
	a0=a0& ~(REG2_DHIZ| REG2_BASS);		//0x6fff; off with bit 12 and 15
	a0|=(REG2_DHIZ| REG2_DMUTE | REG2_BASS);     // v0=0xd000;
	a0|=0x8;
	v0=0x10aa;
	fm_data->regfile[2]=a0; // short 208
	fm_data->regfile[4]=v1; // short 212
	fm_data->regfile[5]=v0; // short 214

	fm_regional_cfg(fm_data,1);

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

	fm_tune(fm_data,8810);
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
