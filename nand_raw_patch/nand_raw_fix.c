
#include <linux/module.h>
#include <linux/delay.h>
#include <linux/errno.h>
#include <linux/err.h>
#include <linux/sched.h>
#include <linux/slab.h>
#include <linux/types.h>

#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/nand_ecc.h>
#include <linux/mtd/compatmac.h>
#include <linux/interrupt.h>
#include <linux/bitops.h>
#include <linux/leds.h>
#include <asm/io.h>

#ifdef CONFIG_MTD_PARTITIONS
#include <linux/mtd/partitions.h>
#endif

#include <asm/jzsoc.h>

#define DESCRIPTION "nand raw page fix for ingenic"
#define AUTHOR "Jag Sjalv"

static unsigned int wp_func=0;



static int find_func(void) {

	int i;
#if 0
	unsigned int fptr=(unsigned int)nand_write_page;
#endif

	if ((wp_func&~3)!=wp_func) {
		printk("unaligned address\n");
		return 0;
	}

	printk("got nand_write_page() at %x\n",wp_func);

	printk("-----------------------------------\n");
	for(i=0;i<100;i++) {
		unsigned int *faddr=(unsigned int *)(wp_func+i);
		unsigned int instr=htonl(*faddr);
		printk("%x\n",*faddr);
		if (instr==0x804230) {
			printk("found instruction p at %x\n",i+wp_func);

			*faddr=ntohl(0x4400a28f); // lw v0,68(sp)

			break;
		}
	}
	printk("-----------------------------------\n");


	return 0;
}

module_param(wp_func, uint, 0);
MODULE_PARM_DESC(wp_func, "potatis");

/*
 * module init
 */
static int __init bub_init_module(void) {
	find_func();
	return 0;
}


/*
 *
 */
static void __exit bub_cleanup_module(void) {
}

MODULE_LICENSE("GPL is shit");
MODULE_DESCRIPTION(DESCRIPTION);
MODULE_AUTHOR(AUTHOR);
module_init(bub_init_module);
module_exit(bub_cleanup_module);

