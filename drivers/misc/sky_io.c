#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/sched.h>
#include <linux/interrupt.h>
#include <linux/time.h>
#include <linux/timer.h>
#include <linux/fs.h>
#include <linux/miscdevice.h>
#include <linux/string.h>
#include <linux/errno.h>
#include <linux/init.h>

#include <asm-mips/mach-jz4750d/jz4750d.h>


MODULE_AUTHOR("The Reverser");
MODULE_LICENSE("GPL");

static unsigned long ul_7310;
static atomic_t a_7314;

static ssize_t sky_io_read(struct file *filp, char __user *buffer,
			size_t count, loff_t *ppos) {
	printk("sky_io_read: called\n");
	return 0;
}

static ssize_t sky_io_write(struct file *filp, const char __user *buffer,
			size_t count, loff_t *ppos) {
	printk("sky_io_write:called\n");
	return count;
}

unsigned int jz_read_battery(void);
unsigned int jz_read_adin1(void);

static int sky_io_ioctl(struct inode *inode, struct file *filp,
			unsigned int cmd, unsigned long arg) {
	printk("sky_io_ioctl: called, cmd=%x, arg =%lx\n", cmd, arg);

	switch(cmd) {
		case 1: {
			printk("toogle port 3 0x1000000\n");
			preempt_disable();
			if (arg==0) { /* disable */
				__gpio_clear_pin((3*32)+24);
			} else {   /* enable */
				__gpio_set_pin((3*32)+24);
			}
			preempt_enable();
			return 0;
			break;
		}
		case 2: {
			unsigned int vbat;
			if (!arg) return -14;
			printk("read battery\n");
			preempt_disable();
			vbat=jz_read_battery();
			preempt_enable();
//			if (((arg+4)|arg)&v1) return -14;
			if ((__copy_to_user((void __user *)arg,&vbat,sizeof(vbat)))){
				return -14;
			}
			return 0;
			break;
		}
		case 4: {
			printk("toggle port 3 0x4000000\nr");
			preempt_disable();
			if (arg==0) { /* disable */
				__gpio_clear_pin((3*32)+26);
			} else {   /* enable */
				__gpio_set_pin((3*32)+26);
			}
			preempt_enable();
			return 0;
			break;
		}
		case 11: {
			unsigned int adin1;
			if (!arg) return -14;
			printk("read_adin1\n");
			preempt_disable();
			adin1=jz_read_adin1();
			preempt_enable();
//			if (((arg+4)|arg)&v1) return -14;
			if ((__copy_to_user((void __user *)arg,&adin1,sizeof(adin1)))){
				return -14;
			}
			return 0;
			break;
		}
		default:
			printk("bad command\n");
	}

	return -EIO;
}

static int sky_io_open(struct inode *inode, struct file *filp) {
	printk("sky_io_open: called\n");
	if (!test_and_set_bit(0,&ul_7310)) {
		atomic_set(&a_7314,0);
	}
	atomic_inc(&a_7314);
	if (atomic_read(&a_7314)<3)
		return 0;
	else {
		atomic_dec(&a_7314);
		return -13;
	}
	return -EIO;
}

static int sky_io_release(struct inode *inode, struct file *filp) {
	printk("sky_io_release:called\n");
	return -EIO;
}

static const struct file_operations sky_io_fops = {
	.read	= sky_io_read,
	.write	= sky_io_write,
	.ioctl	= sky_io_ioctl,
	.open	= sky_io_open,
	.release= sky_io_release
};

static struct miscdevice sky_io_dev = {
	.minor = 255,
	.name  = "sky_io",
	.fops  = &sky_io_fops
};

static int __init sky_io_init(void) {
	int rc;

	printk("<6> SKY_IO: driver ver %s\n", "1.0.0");
	rc=misc_register(&sky_io_dev);

	if (rc<0) goto out;

	printk("<6>SKY_IO: misc dev got minor %i\n", sky_io_dev.minor);

	__gpio_set_pin((3*32)+24);
	__gpio_as_output((3*32)+24);
	__gpio_set_pin((3*32)+24);

	__gpio_set_pin((3*32)+26);
	__gpio_as_output((3*32)+26);
	__gpio_set_pin((3*32)+26);

	return 0;

out:
	printk("<3> SKY_IO %s: Can't register misc device with minor %d\n",
			"sky_io_init", sky_io_dev.minor);
	return -5;
}

module_init(sky_io_init);

