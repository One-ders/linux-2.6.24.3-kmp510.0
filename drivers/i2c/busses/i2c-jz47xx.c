/*
 * i2c_jz47xx.c for the INGENIC I2C bus access.
 *
 * Copyright (C) 2006 - 2009 Ingenic Semiconductor Inc.
 * Author: <cwjia@ingenic.cn>
 * The first Modified :<zhzhao@ingenic.cn>
 * Date:20091027 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 */
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/i2c.h>
#include <linux/i2c-id.h>
#include <linux/init.h>
#include <linux/time.h>
#include <linux/sched.h>
#include <linux/delay.h>
#include <linux/errno.h>
#include <linux/platform_device.h>
#include <linux/delay.h>

#include <asm/irq.h>
#include <asm/io.h>
#include <linux/module.h>
#include <asm/addrspace.h>

#include <asm/jzsoc.h>
#include "i2c-jz47xx.h"

/* I2C protocol */
#define I2C_READ	1
#define I2C_WRITE	0

#define TIMEOUT         1000
unsigned long sub_addr = 0;

struct jz_i2c {
	spinlock_t		lock;
	wait_queue_head_t	wait;
	struct i2c_msg		*msg;
	unsigned int		msg_num;
	unsigned int		slave_addr;
	struct i2c_adapter	adap;
	struct clk		*clk;
};

#ifndef CONFIG_COLMAN_USE_SOFT_I2C
/*
 * I2C bus protocol basic routines
 */
static int i2c_put_data(unsigned char data)
{
	unsigned int timeout = TIMEOUT*10;
	__i2c_write(data);
	__i2c_set_drf();
	while (__i2c_check_drf() != 0 && timeout)
		timeout--;
	while (!__i2c_transmit_ended());

	timeout = TIMEOUT*10;	
	while (!__i2c_received_ack() && timeout)
		timeout--;
	if (timeout){
		return 0;
	}
	else{
		return -ETIMEDOUT;
	}
}


static int i2c_get_data(unsigned char *data, int ack)
{
	int timeout = TIMEOUT*10;
	if (!ack)
		__i2c_send_nack();
	else
		__i2c_send_ack();

	while (__i2c_check_drf() == 0 && timeout)
		timeout--;
	if (timeout) {
		if (!ack)
			__i2c_send_stop();
		*data = __i2c_read();
		__i2c_clear_drf();
		return 0;
	} else{

		return -ETIMEDOUT;
	}
}

/*
 * I2C interface
 */
void i2c_jz_setclk(unsigned int i2cclk)
{
	__i2c_set_clk(jz_clocks.extalclk, i2cclk);
}


static int xfer_read(unsigned char device, unsigned char *buf, int length)
{
	int cnt = length;
	int timeout = 5;

	/*eeprom device address transfer*/
#if defined(CONFIG_SENSORS_EEPROM)
	device = 0xa << 3 | ((sub_addr & 0x0700) >> 8);
	sub_addr = sub_addr & 0xff; 
#endif
	


L_try_again:

	if (timeout < 0)
		goto L_timeout;

	__i2c_send_nack();	/* Master does not send ACK, slave sends it */

	__i2c_send_start();

	
	if (i2c_put_data( (device << 1) | I2C_WRITE ) < 0)
		goto device_werr;
	
	if (i2c_put_data(sub_addr) < 0)
		goto address_err;
	
	__i2c_send_start();

	if (i2c_put_data((device << 1) | I2C_READ ) < 0)
		goto device_rerr;


	__i2c_send_ack();	/* Master sends ACK for continue reading */


	while (cnt) {

		if (cnt == 1) {

			if (i2c_get_data(buf, 0) < 0)
				break;
		} else {

			if (i2c_get_data(buf, 1) < 0){
				break;
			}
		}
		cnt--;
		buf++;
	}
	__i2c_send_stop();

	return length - cnt;
 device_rerr:
 device_werr:
 address_err:

	timeout --;
	__i2c_send_stop();
	goto L_try_again;

L_timeout:
	__i2c_send_stop();
	printk("Read I2C device 0x%2x failed.\n", device);
	return -ENODEV;
}


static int xfer_write(unsigned char device, unsigned char *buf, int length)
{
	int cnt = length;
	int cnt_in_pg;
	int timeout = 5;
	unsigned char *tmpbuf;

	/*eeprom device address transfer*/
#if defined(CONFIG_SENSORS_EEPROM)
		device = 0xa << 3 | ((sub_addr & 0x0700) >> 8);
		sub_addr = sub_addr & 0xff; 
#endif
	__i2c_send_nack();	/* Master does not send ACK, slave sends it */

 W_try_again:
	if (timeout < 0)
		goto W_timeout;

	cnt = length;
	tmpbuf = (unsigned char *)buf;

 start_write_page:
	cnt_in_pg = 0;
	__i2c_send_start();
	if (i2c_put_data( (device << 1) | I2C_WRITE ) < 0)
		goto device_err;
	
	if (i2c_put_data(sub_addr) < 0)
		goto address_err;


	
	while (cnt) {
		if (++cnt_in_pg > 8) {
			__i2c_send_stop();
			mdelay(1);
			sub_addr += 8;
			mdelay(2);// add 20091027
			goto start_write_page;

		}


		if (i2c_put_data(*tmpbuf) < 0) 
			break;
		cnt--;
		tmpbuf++;
	}
	__i2c_send_stop();
	return length - cnt;
 device_err:
 address_err:
	timeout--;
	__i2c_send_stop();
	goto W_try_again;

W_timeout:
	printk( "Write I2C device 0x%2x failed.\n", device);
	__i2c_send_stop();
	return -ENODEV;
}

static int i2c_jz_xfer(struct i2c_adapter *adap, struct i2c_msg *pmsg, int num)
{
	int ret, i;

	dev_dbg(&adap->dev, "jz47xx_xfer: processing %d messages:\n", num);
	for (i = 0; i < num; i++) {
		dev_dbg(&adap->dev, " #%d: %sing %d byte%s %s 0x%02x\n", i,
			pmsg->flags & I2C_M_RD ? "read" : "writ",
			pmsg->len, pmsg->len > 1 ? "s" : "",
			pmsg->flags & I2C_M_RD ? "from" : "to",	pmsg->addr);
		if (pmsg->len && pmsg->buf) {	/* sanity check */
			if (pmsg->flags & I2C_M_RD){

				ret = xfer_read(pmsg->addr,  pmsg->buf, pmsg->len);
			}else{

				ret = xfer_write(pmsg->addr,  pmsg->buf, pmsg->len);
			}
			if (ret)
				return ret;
			/* Wait until transfer is finished */
		}
		dev_dbg(&adap->dev, "transfer complete\n");
		pmsg++;		/* next message */
	}
	return i;
}

#else
static void i2c_soft_delay(void) {
        udelay(4);
}

static int i2c_soft_scl(int i) {

        if (i&0xff) {
                unsigned int sclpin;
                int retry=100;
                REG_GPIO_PXDIRC(4)=0x2000;
again:
                udelay(1);
                sclpin=REG_GPIO_PXPIN(4);
                if (!(sclpin&0x2000)) {
                        retry--;
                        if (retry<0) goto err;
                        goto again;
                }
                return 0;
        } else {
                REG_GPIO_PXDATC(4)=0x2000;
                REG_GPIO_PXDIRS(4)=0x2000;
                return 0;
        }
err:
        printk("Colman: I2C SCL always low\n");
        return -145;
}

static int i2c_soft_get_sda(void) {
        unsigned int sdapin=REG_GPIO_PXPIN(4);
        return ((sdapin>>0xc)&1);
}

static void i2c_soft_sda(unsigned int i) {
#if 0
        unsigned int sdapin=i&0xff;
        if (sdapin) {
#endif
        if (i) {
                REG_GPIO_PXDIRC(4)=0x1000;
        } else {
                REG_GPIO_PXDATC(4)=0x1000;
                REG_GPIO_PXDIRS(4)=0x1000;
        }
        return;
}

static void i2c_soft_send_start(void) {
        i2c_soft_sda(1);
        i2c_soft_delay();
        i2c_soft_scl(1);
        i2c_soft_delay();
        i2c_soft_sda(0);
        i2c_soft_delay();
        i2c_soft_scl(0);
}

static int i2c_put_data(unsigned int data) {
        int i;
        int rc;
        for(i=0;i<8;i++) {
                i2c_soft_delay();
                i2c_soft_sda(data&0x80);
                i2c_soft_delay();
                rc=i2c_soft_scl(1);
                if (rc<0) {
                        goto err;
                }
                i2c_soft_delay();
                i2c_soft_scl(0);
                data=data<<1;
        }
        i2c_soft_sda(1);
        i2c_soft_delay();
        rc=i2c_soft_scl(1);
        if(rc<0) {
                goto err;
        }
        i2c_soft_delay();
        rc=i2c_soft_get_sda();
        i2c_soft_scl(0);
        if (rc) goto err;
        return 0;

err:
        printk("i2c_put_data: err\n");
        return -145;

}

static int i2c_jz_xfer(struct i2c_adapter *adap, struct i2c_msg *pmsg, int num){
        int ret, i;
        for (i = 0; i < num; i++) {
                int len=pmsg->len;
                if (pmsg->flags & I2C_M_RD) {
                        int l;
                        i2c_soft_send_start();
                        if (i2c_put_data((pmsg->addr<<1)|1)<0)
                                goto rd_put_data_err;
                        for(l=0;l<pmsg->len;l++) {
                                unsigned char b0=0;
                                int b;
                                for(b=0;b<8;b++) {
                                        i2c_soft_delay();
                                        ret=i2c_soft_scl(1);
                                        if (ret<0) goto scl_err;
                                        i2c_soft_delay();
                                        b0=(b0<<1);
                                        ret=i2c_soft_get_sda();
                                        if (ret) b0|=1;
                                        i2c_soft_scl(0);
                                }

#if 0
                                if (((num-i)==1)&&((pmsg->len-l)==1)) {
#endif
                                if ((pmsg->len-l)==1) {
                                        i2c_soft_sda(1);
                                } else {
                                        i2c_soft_sda(0);
                                }
                                i2c_soft_delay();
                                ret=i2c_soft_scl(1);
                                if (ret<0) goto scl_err;
                                i2c_soft_delay();
                                i2c_soft_scl(0);
                                i2c_soft_delay();
                                i2c_soft_sda(1);
                                pmsg->buf[l]=b0;
                        }
                } else {
                        int l;
                        i2c_soft_send_start();
                        if (i2c_put_data(pmsg->addr<<1)<0) {
                                goto wr_put_data_err;
                        }
                        for(l=0;l<pmsg->len;l++) {
                                ret=i2c_put_data(pmsg->buf[l]);
                                if (ret<0) {
                                        goto wr_put_data_err;
                                }
                        }

                }

                if (len<0) {
                        ret=len;
                        printk("len<0: returning early\n");
                        goto out;
                }
                pmsg++;
        }

        ret=i;

out:
        i2c_soft_scl(0);
        i2c_soft_delay();
        i2c_soft_sda(0);
        i2c_soft_delay();
        i2c_soft_scl(1);
        i2c_soft_delay();
        i2c_soft_sda(1);
        return ret;


wr_put_data_err:
        printk("Write I2C device 0x%2x failed.\n", 2);
        goto out2;

rd_put_data_err:
scl_err:
        printk("Read I2C device 0x%2x failed.\n", 111);
out2:
        ret=-19;
        i2c_soft_scl(0);
        i2c_soft_delay();
        i2c_soft_sda(0);
        i2c_soft_delay();
        i2c_soft_scl(1);
        i2c_soft_delay();
        i2c_soft_sda(1);
        return ret;
}

#endif

static u32 i2c_jz_functionality(struct i2c_adapter *adap)
{
	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
}

static const struct i2c_algorithm i2c_jz_algorithm = {
	.master_xfer	= i2c_jz_xfer,
	.functionality	= i2c_jz_functionality,
};

static int i2c_jz_probe(struct platform_device *dev)
{

	struct jz_i2c *i2c;
	struct i2c_jz_platform_data *plat = dev->dev.platform_data;
	int ret;

#ifdef CONFIG_COLMAN_USE_SOFT_I2C
        __gpio_as_input((4*32)+12);
        __gpio_as_input((4*32)+13);
#else
	__gpio_as_i2c(); // open i2c 20091027
	__i2c_set_clk(jz_clocks.extalclk, 10000); /* default 10 KHz */
	__i2c_enable();
#endif

	i2c = kzalloc(sizeof(struct jz_i2c), GFP_KERNEL);
	if (!i2c) {
		printk("There is no enough memory\n");
		ret = -ENOMEM;
		goto emalloc;
	}

	i2c->adap.owner   = THIS_MODULE;
	i2c->adap.algo    = &i2c_jz_algorithm;
	i2c->adap.retries = 5;
	spin_lock_init(&i2c->lock);
	init_waitqueue_head(&i2c->wait);
	sprintf(i2c->adap.name, "jz_i2c-i2c.%u", dev->id);
	i2c->adap.algo_data = i2c;
	i2c->adap.dev.parent = &dev->dev;

	if (plat) {
		i2c->adap.class = plat->class;
	}

	/*
	 * If "dev->id" is negative we consider it as zero.
	 * The reason to do so is to avoid sysfs names that only make
	 * sense when there are multiple adapters.
	 */
	i2c->adap.nr = dev->id != -1 ? dev->id : 0;
	/* ret = i2c_add_adapter(&i2c->adap); */
	ret = i2c_add_numbered_adapter(&i2c->adap);
	if (ret < 0) {
		printk(KERN_INFO "I2C: Failed to add bus\n");
		goto eadapt;
	}

	platform_set_drvdata(dev, i2c);
#ifdef CONFIG_COLMAN_USE_SOFT_I2C
        dev_info(&dev->dev, "Soft i2c bus driver.\n");
#else
	dev_info(&dev->dev, "JZ47xx i2c bus driver.\n");
#endif

	return 0;
eadapt:
	__i2c_disable();
emalloc:
	return ret;
}

static int i2c_jz_remove(struct platform_device *dev)
{
	struct i2c_adapter *adapter = platform_get_drvdata(dev);
	int rc;

	rc = i2c_del_adapter(adapter);
	platform_set_drvdata(dev, NULL);
	return rc;
}

static struct platform_driver i2c_jz_driver = {
	.probe		= i2c_jz_probe,
	.remove		= i2c_jz_remove,
	.driver		= {
		.name	= "jz_i2c",
	},
};

static int __init i2c_adap_jz_init(void)
{
	return platform_driver_register(&i2c_jz_driver);
}

static void __exit i2c_adap_jz_exit(void)
{
	return platform_driver_unregister(&i2c_jz_driver);
}

MODULE_LICENSE("GPL");

module_init(i2c_adap_jz_init);
module_exit(i2c_adap_jz_exit);
