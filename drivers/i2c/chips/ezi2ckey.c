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
#include <asm/bitops.h>

#include <asm-mips/mach-jz4750d/jz4750d.h>

#define EZI_VER "3.0.4"

static struct i2c_driver ezi_driver;
static unsigned short normal_i2c[] = {0x29, I2C_CLIENT_END};
I2C_CLIENT_INSMOD;

#define KEY_DOWN 0x10
#define KEY_UP	 0x20

static unsigned int ui_af64;
static unsigned int prev_key;
static struct i2c_client *i2c_client=0;
static int magicOK;
static int i_77c8;
static int i_77cc;
static unsigned int ui_77d0;
static unsigned short int usi_77d4;
static unsigned short int usi_77d6;

static unsigned long int ul_77d8;

struct MCU_ID {
	unsigned char	version_major;
	unsigned char	version_minor;
	unsigned char	date_y;
	unsigned char	date_m;
	unsigned char	date_d;
};

static struct MCU_ID mcu_id;  // 77dc
static unsigned char bytebuf8[8];  // 77e4

static atomic_t  a_77ec;
static unsigned char key_str[16];
static unsigned short int usi_7800;

static int ht46r22_probe(struct i2c_adapter *adapter, int address, int kind) {
	int rc;
	struct i2c_client *cl=kzalloc(sizeof(struct i2c_client), GFP_KERNEL);

	printk("ht46r22_probe\n");
	if (!cl) {
		printk("ht46r22_probe: return nomem\n");
		return -ENOMEM;
	}
	strlcpy(cl->name,"ezi2ckey",I2C_NAME_SIZE);
	cl->addr=address;
	cl->adapter=adapter;
	cl->driver=&ezi_driver;

	rc=i2c_attach_client(cl);
	if (rc) {
		printk("error i2c_attach_client: rc = %d\n", rc);
		kfree(cl);
		return rc;
	}
	printk("<6>EzI2CKEY: Push button keyboard detected\n");
	i2c_client=cl;
	return rc;
}

static int ht46r22_attach(struct i2c_adapter *adapter) {
	printk("ht46r22_attach\n");
	return i2c_probe(adapter,&addr_data,ht46r22_probe);
}

static int ht46r22_detach(struct i2c_client *client) {
	printk("ht46r22_detach\n");
	return 0;

}

int dump_bytes(unsigned char *buf, int len) {
	int i;

	printk("dump bytes:\n");
	for(i=0;i<len;i++) {
		if (!(i%16)) {
			printk("%08x: %02x", i, buf[i]);
		} else if (!((i+1)%16)) {
			printk(" ,%02x\n",buf[i]);
		} else if (i==(len-1)) {
			printk(" ,%02x\n",buf[i]);
		} else {
			printk(" ,%02x",buf[i]);
		}
	}
	return 0;
}

static int SendMagicPacket(void) {
	unsigned char msg[17];
	int rc;
//	unsigned int a2,a3,a0,v0,v1,t0;
	int a2,a3,a0,v0,v1,t0;
	unsigned int ix,tmp,tmp1;

	a3=usi_77d4;
	usi_7800=REG_RTC_RSR&0xffff;
	a2=((REG_RTC_RSR&0xffff)+1)&0xffff;
	while ((!a2) || (a3==a2) || (usi_77d6==a2)) {
		a2++;
		a2&=0xffff;
	}

	a3=jiffies;
	t0=REG_RTC_RSR;
	usi_7800=a2;
	usi_77d4=usi_77d6;
	usi_77d6=a2;
	key_str[0]=a2;
	key_str[1]=a2>>8;

	for(ix=0;ix<0x10;ix++) {
		a0=t0+a3;
		if ((a0<a3)||(a0<t0)) {
			a0=a0+1;
			key_str[ix]=a0;
		} else {
			key_str[ix]=a0;  /* set byte 0 > 15 */
		}
		t0=a3;
		a3=a0;
	}
	dump_bytes(key_str,16);

	v1=key_str[0];
	for(ix=2;ix<7;ix++) {
		v0=key_str[ix];  // ix1 2-6
		v0=v0^v1;
		v0++;
		key_str[ix]=v0;   /* 2 - 6 */
	}

	v1=key_str[1];
	for(;ix<0x0c;ix++) {
		v0=key_str[ix]; // ix1 7-0xb
		v0=v0^v1;
		v0=v0+32;
		key_str[ix]=v0;  /* 7 - b */
	}

	tmp=0;	  // (a2)
	for(ix=3;ix<0x0d;ix=ix+2) {
		v1=key_str[ix];
		v0=key_str[ix-1];
		v1=v1<<8;
		v0=v0+tmp;
		v1=v1+v0;
		tmp=v1&0xffff;
	}

	tmp1=key_str[1];
	v1=key_str[0];
	v0=tmp>>8;
	v0=v0^tmp1;
	v1=v1^tmp;
	key_str[13]=v0;
	key_str[12]=v1;

	tmp=0;
	for(ix=2;ix<0x0e;ix++) {
		v0=key_str[ix];
		v0=v0+tmp;
		tmp=v0&0xffff;
	}

	key_str[15]=(tmp>>8)^key_str[1];
	key_str[14]=tmp^key_str[0];

	v1=key_str[0];
	for(ix=2;ix<7;ix++) {
		v0=key_str[ix];
		v0=v0-1;
		v0=v0^v1;
		key_str[ix]=v0;
	}

	v1=key_str[1];
	for(;ix<0x0c;ix++) {
		v0=key_str[ix];
		v0=v0-32;
		v0=v0^v1;
		key_str[ix]=v0;
	}

	memcpy(&msg[1],key_str,16);
	msg[0]=17;

	dump_bytes(&msg[0],17);
	rc=i2c_master_send(i2c_client,msg,17);
	if (!(rc^17)) {
		return 0;
	}
	return -1;
}

static int PollMagicReady(void) {
	int s1=19;
	while (i2c_smbus_read_byte_data(i2c_client,24)) {
		printk("i2c_smb_rbd() returned something\n");
		udelay(100);
		s1--;
		if (s1==-1) {
			return -1;
		}
	}
	return 0;
}

int CalExpPacket(void) {
	unsigned int v0,v1,a0,a1,a3,t0;
	unsigned char *p=key_str;
	int ix;
	v1=key_str[0];
	/* nb1 */
	for(ix=2;ix<7;ix++) {
		v0=p[ix];
		v0=v0^v1;
		v0=v0+1;
		p[ix]=v0;
	}
	/* nb2 */
	v1=key_str[1];
	for(;ix<0xc;ix++) {
		v0=p[ix];
		v0=v0^v1;
		v0=v0+32;
		p[ix]=v0;
	}
	v0=key_str[14];
	v0=v0^0x5a;
	key_str[0]=v0;
	t0=v0;
	v1=key_str[12];
	a3=v1^0xa5;
	key_str[1]=a3;

	/* nb3 */
	a1=0;
	for(ix=3;ix<0x0d;ix=ix+2) {
		v0=key_str[ix];
		v1=key_str[ix-1];
		v0=a3^v0;
		v1=t0^v1;
		v1=a1+v1;
		v0=v0<<8;
		v0=v0+v1;
		a1=v0&0xffff;
	}

	a0=key_str[1];
	v0=a1>>8;
	v0=v0^a0;
	a1=t0^a1;
	key_str[13]=v0;
	key_str[12]=a1;

/* ========================================= */

	a3=key_str[0];
	/* nb4 */
	a1=108;
	for(ix=2;ix<8;ix++) {
		v0=key_str[ix];
		v0=a3^v0;
		v0=a1+v0;
		a1=v0&0xffff;
	}

	/* nb5 */
	a0=key_str[1];
	for(;ix<0x0e;ix++) {
		v0=key_str[ix];
		v0=a0^v0;
		v0=a1+v0;
		a1=v0&0xffff;
	}

	a0=key_str[1];
	v0=a1>>8;
	v0=v0^a0;
	a1=a3^a1;
	key_str[15]=v0;
	key_str[14]=a1;

	return 0;
}

static int i2ckey_read(int a1, unsigned char *buf, int len) {
	int rc;
	unsigned char cmd=a1;
	struct i2c_msg msgs[] = {{
		.addr = i2c_client->addr,
		.flags= i2c_client->flags&0x10,
		.len=1,
		.buf=(void *)&cmd,
	},{
		.addr = i2c_client->addr,
		.flags =(i2c_client->flags&0x10)|1,
		.len=len,
		.buf=buf,
	},
	};
	rc=i2c_transfer(i2c_client->adapter,msgs,2);
	if (rc==2) return len;
	return rc;
}

void check_magic_packet(void) {
	int rc;
	unsigned char buf[16];

	magicOK=0;
	rc=SendMagicPacket();
	if (rc) {
		printk("SendMagicPacket() failed\n");
		return;
	}
	rc=PollMagicReady();
	if (rc) {
		printk("PollMagicReady() failed\n");
		return;
	}
	memset(buf,0,16);
	rc=i2ckey_read(18,buf,16);
	if (rc<0) {
		printk("i2ckey_read() failed\n");
		return;
	}
	CalExpPacket();
	if (memcmp(key_str, buf, 16)==0) {
		magicOK=1;
	}
	return;
}

int ezi2cio_get_mac_addr(unsigned char *buf, int size) {
	printk("get_mac_addr: buf %p size %d\n", buf, size);
	if (size>=9) return -1;
	if (!i2c_client) return -1;
	if (i_77cc) return -1;

	memcpy(buf,bytebuf8,size);
	return 0;
}

EXPORT_SYMBOL(ezi2cio_get_mac_addr);

static struct i2c_driver ezi_driver = {
	.driver = {
		.name = "ezi2cio",
	},
	.attach_adapter = ht46r22_attach,
	.detach_client	= ht46r22_detach,
};

static loff_t i2cio_llseek(struct file *file, loff_t off, int whence) {
	printk("i2cio_llseek:\n");
	return 0;
}

static ssize_t i2cio_read(struct file *file, char __user *buffer,
			  size_t count, loff_t *ppos) {
	printk("i2cio_read:\n");
	return 0;
}

static ssize_t i2cio_write(struct file *file, const char __user *buffer,
			   size_t count, loff_t *ppos) {
	printk("i2cio_write\n");
	return 0;
}

static int i2cio_ioctl(struct inode *inode, struct file *file,
		unsigned int cmd, unsigned long arg) {
	void __user *p=(void __user *)arg;

	int bub=-0xb201;
	int nr=_IOC_NR(cmd)-1;
	unsigned int rc;
	unsigned long v0, v1, a0, a1;
	unsigned char key_event;
	unsigned char key_code;
#if 0
	printk("i2cio_ioctl: cmd %x, arg %x\n", cmd,arg);
	printk("i2cio_ioctl: dir=%d,type=%d,nr=%d,size%d\n",
		_IOC_DIR(cmd), _IOC_TYPE(cmd), _IOC_NR(cmd), _IOC_SIZE(cmd));
#endif

	if (_IOC_TYPE(cmd)!=178) {
		return -ENOTTY;
	}

	if (!i2c_client) goto err;

	if (nr>=100) goto err;

	switch(nr) {
		case 0: {
			if (!(arg<2)) goto err;
			if (mcu_id.version_major<2) {
				printk("ioctl: nr %d\n set 77d0=0, mcu_id.version_major=%x\n", nr, mcu_id.version_major);
				ui_77d0=0;
			} else {
				printk("ioctl: nr %d\n set 77d0=arg(%lx)\n", nr, arg);
				ui_77d0=arg;
			}
			return 0;
		}
		case 2: {
			return i2c_smbus_write_byte_data(i2c_client,3,arg&0xff);
			break;
		}
		case 4: {
//func5:
			if (i_77c8) {
				if (!(REG_GPIO_PXPIN(4) & 0x80000)) {
//nb6
					prev_key=0xff;
					return -EAGAIN;
				};
			}
//nb5
//			Read button
			rc=i2c_smbus_read_word_data(i2c_client,5);
			printk("read_word_data returned %x\n",rc);
			key_code=rc&0xff;
			key_event=(rc>>8)&0xff;
			if (key_code==0xaa) {
//nb7
				printk("Keep Power command sent\n");
				i2c_smbus_write_word_data(i2c_client,22,0x5aa5);
			}
			//if (a0!=0xff) printk("case 4: v1=%x,a0=%x,a1=%x\n",v1,a0,a1);
			printk("case 4: key_code=%lx,key_event=%lx\n",key_code,key_event);
			if (mcu_id.version_major>=3) {
//nb8
				if (key_event==0x10) {	// Key pad key down
//nb8_1:
					if (ui_77d0&1) {  // mode ??
//						v1=preui_af64;
//						v0=v1&0xff;
						if ((key_code==(prev_key&0xff))&&
//nb8_1_2:
							(prev_key&0x1000)) {
								prev_key=key_code|0x9000;
//nb8_1.1
						} else {
							prev_key=key_code|0x1000;
						}
						if (copy_to_user((void *)arg,&prev_key,4)) {
							return -14;
						}
						return 0;
						break;
					} else {
//nb20011:
						v1=ui_af64;
						if (v1==254) {
//nb20111:
							rc=255;
							goto ioctl_nb12;
							break;
						}
						v1=v1&0xc0;
						rc=255;
						if (v1!=128) {
							a0=254;
							goto nb8_out;
						}
						goto ioctl_nb12;
						break;
					}
				} else if (key_event==0x20) { // Key PAD key  UP
//nb20002:
					prev_key=255;
					if (copy_to_user((void *)arg,&key_code,4)) {
						return -14;
					}
					return 0;
				} else if (key_event==0x40) { // Key Down Remote
//nb8_3:
					prev_key=key_code|0x100;
					if (key_code<32) {
						prev_key=key_code|0xc0;
					}
					if (copy_to_user((void *)arg,&prev_key,4)) {
						return -14;
					}
					return 0;
				} else if (key_event==0xc0) { // Key repeat remote
//nb8_4:
					prev_key=key_code|0x8100;
					if (key_code<32) {
						prev_key=key_code|0x80c0;
					}
					if (copy_to_user((void *)arg,&prev_key,4)) {
						return -14;
					}
					return 0;
				}
				break;
			} else {  // old mcu
				if (!a1) {
//nb9;

					rc=a0;
					ui_af64=rc;
					goto ioctl_nb12;
//					return -13;
				} else {
#if 0
					if (a0==254) goto nb10;
					v0=a0|0x8000;
					if (a1==a0) goto nb11;
#endif
printk("old mcu not handled\n");
				}
			}

nb8_out:
			rc=a0;
			ui_af64=rc;
			goto ioctl_nb12;
		}
		case  9: {
// func 10:
			rc=i2c_smbus_read_word_data(i2c_client, 10);
			printk("read_word_data returned %x\n",rc);
			goto ioctl_nb12;
		}
		case  10: {
// func 11:
			if (mcu_id.version_major<2) {
				return -EINVAL;
			} else {
				rc=i2c_smbus_read_word_data(i2c_client, 11);
			printk("read_word_data returned %x\n",rc);
				goto ioctl_nb12;
			}
		}
		case  15: {
// func 16:
			char ebuf[20];
			int rc;
			rc=ezi2cio_get_mac_addr(ebuf,8);
			if (rc<0) {
				return -EIO;
			}

			if (copy_to_user((void *)arg,ebuf,8)) {
				return -14;
			}
			return 0;
		}
		case 16: case 99: {
// func 17: send magic key
//			
			unsigned char bstr[17];
			if (nr==16)  {
				bstr[0]=17;
			} else {
				bstr[0]=25;
			}
			if (copy_from_user(&bstr[1],(void *)arg,16)) {
				printk("i2cio_ctl: nr 16 err, copy_from_user\n");
				return -14;
			}
			rc=i2c_master_send(i2c_client,bstr,17);
			if (rc<0) {
				printk("i2cio_ioctl: error from i2c_master_send\n");
				return rc;
			}
			return 0;
		}
		case 17: {
// func 18:
			unsigned char buf[17];
			int rc;
			if ((rc=i2ckey_read(18,buf,16))<0) {
				return rc;
			}
			if (copy_to_user((void *)arg,buf,16)) {
				return -14;
			}
			return 0;
		}
		case 23: {
// func 24:
			rc=i2c_smbus_read_byte_data(i2c_client,24);
			goto ioctl_nb12;
		}
		default:
			printk("i2cio_ioctl: unandled cmd %d\n", nr);
			return -EINVAL;
	}

	printk("i2cio_ioctl: after switch, returning -1, cmd=%x\n",nr);
	return -1;

ioctl_nb12:
	if (copy_to_user((void *)arg,&rc,4)) {
		return -14;
	}
	return 0;

err:
	printk("i2cio_ioctl: err\n");
	return -EINVAL;
}

static int i2cio_open(struct inode *inode, struct file *file) {
	printk("i2cio_open:\n");
	if (!test_and_set_bit(0,&ul_77d8)) {
		atomic_set(&a_77ec,0);
	}
	atomic_inc(&a_77ec);
	if (atomic_read(&a_77ec)<5)
		return nonseekable_open(inode,file);
	else {
		atomic_dec(&a_77ec);
		return -13;
	}
	return -13;
}

static int i2cio_release(struct inode *inode, struct file *file) {
	printk("i2cio_release:\n");
	atomic_dec(&a_77ec);
	if (!atomic_read(&a_77ec)) {
		clear_bit(0,&ul_77d8);
	}
	return 0;
}

static const struct file_operations ezi2ckey_fops = {
	.llseek = i2cio_llseek,
	.read	= i2cio_read,
	.write	= i2cio_write,
	.ioctl	= i2cio_ioctl,
	.open	= i2cio_open,
	.release= i2cio_release,
};

static struct miscdevice ezi2ckey_dev = {
	.minor	= 255,
	.name	= "ezi2ckey",
	.fops	= &ezi2ckey_fops
};

static int board_info_proc(char *page, char **start, off_t off,
				int count, int *eof, void *data) {
	int len=0;
	char build_str[24];
	char *p;
	int j;
	len+=sprintf(page+len,"MCU version: %d.%02d\n",
			mcu_id.version_major,mcu_id.version_minor);
	len+=sprintf(page+len,"MCU date: 20%02x/%02x/%02x\n",
			mcu_id.date_y,mcu_id.date_m,mcu_id.date_d);
	len+=sprintf(page+len,"Board ID: ");
	if ((bytebuf8[6]==85) && (bytebuf8[7]==170)) {
		int i;
		for(i=0;i<6;i++) {
			len+=sprintf(page+len,"%02x",bytebuf8[i]);
		}
		len+=sprintf(page+len,"\n");
	} else {
		len+=sprintf(page+len,"Unknown\n");
	}

	len+=sprintf(page+len,"Board Ver: Kmp510 V0.3\n");
	len+=sprintf(page+len,"Audio Codec: JZ4750, JZ4750D or JZ4750L internal Codec\n");
	len+=sprintf(page+len,"JZ4750 MSC1: Enabled, 1-bit bus\n");
	len+=sprintf(page+len,"U-Boot build: ");
	memset(build_str,0,20);
	j=0;
	p=saved_command_line;
	printk("using saved command line :%s:\n",p);
	while (*p) {
		if (!memcmp(p,"build=",6)) {
			p=p+6;
			if (!(*p)) break;
			if ((*p==' ') || (*p=='\n') || (*p=='\r')) {
				continue;
			} else {
				if (j>20) continue;
again:
				build_str[j]=*p;
				p++;
				if (!(*p)) break;
				j++;
				if((*p==' ')||(*p=='\n')||(*p=='\r')) continue;
				if (j!=19) goto again;
				continue;
			}
		} else {
again1:
			if (*p==' ') {
				p++;
				while (*p==' ') p++;
				continue;
			} else if (!*p) break;
			p++;
			goto again1;
		}
	}
	if (strlen(build_str)) {
		len+=sprintf(page+len,build_str);
	} else {
		len+=sprintf(page+len,"Unknown");
	}

	len+=sprintf(page+len,"\n");
	*eof=1;
	return len;
}

static int __init ezi2cio_init(void) {
	int rc;
	struct proc_dir_entry *pde;
	printk("<6>EzI2CKEY: driver ver %s\n", EZI_VER);

	rc=i2c_add_driver(&ezi_driver);
	printk("i2c_add_driver: returned %d\n",rc);
	if (!i2c_client) {
		printk("Colman: %s no ezi2key found\n", "ezi2cio_init");
hang:
		goto hang;
	}
	check_magic_packet();
	if (!magicOK) {
		printk("Bad Magic Key\n");
		goto hang;
	}

	rc=misc_register(&ezi2ckey_dev);
	if (rc<0) {
		printk("<3>EzI2CKEY %s: Can't register misc device with minor %d\n",
		"ezi2cio_init", ezi2ckey_dev.minor);
		i2c_del_driver(&ezi_driver);
		return -5;
	}
	printk("<6>EzI2CKEY: misc dev got minor %i\n", ezi2ckey_dev.minor);

	if (i2c_client) {
		i_77c8=1;
		__gpio_as_input((4*32)+19);
		__gpio_disable_pull((4*32)+19);
		rc=i2c_smbus_read_word_data(i2c_client, 5);
		if ((rc&0xff)==170) {
			printk("Keep Power command sent\n");
			i2c_smbus_write_word_data(i2c_client,22, 23205);
		} else {
			printk("could not enable keep power, val %d\n",rc&0xff);
		}
	}
	rc=i2ckey_read(19,&mcu_id,5);
	printk("mcu_id: read %d bytes\n",rc);
	if (rc<0) {
		memset(&mcu_id,0,5);
	}
	rc=i2ckey_read(16,bytebuf8,8);
	printk("bytesbuf8: read %d bytes\n",rc);
	if (rc<0) {
		memset(bytebuf8,0,8);
		i_77cc=1;
	}

	pde=create_proc_entry("board_info",0,NULL);
	if (pde) {
		pde->read_proc=board_info_proc;
		pde->write_proc=NULL;
	}

	return 0;
}
static void __exit grux(void) {
	printk("grux called\n");
}

MODULE_AUTHOR("The Reverser");
MODULE_DESCRIPTION("Reverse enginered driver for the kmp510 i2c keyboard!");
MODULE_LICENSE("GPL");

module_init(ezi2cio_init);
module_exit(grux);

