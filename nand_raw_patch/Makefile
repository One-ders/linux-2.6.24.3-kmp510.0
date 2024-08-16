# if KERNELRELEASE is defined, we've been invoked from the
# kernel build system and can use its language.
ifneq (${KERNELRELEASE},)
obj-m := nand_raw_fix.o
sdio_lib-objs := nand_raw_fix.o
MY_CFLAGS +=
ccflags-y += ${MY_CFLAGS}
CC += ${MY_CFLAGS}

# Otherwise we were called directly from the command line.
# Invoke the kernel build system.
  else
#    KERNEL_SOURCE := /usr/src/linux
    KERNEL_SOURCE := /home/anders/mips/dev/ingenic/rebuild/2.6.24.3/linux-2.6.24.3
    PWD := $(shell pwd)
default:
	${MAKE} -C ${KERNEL_SOURCE} SUBDIRS=${PWD} modules

clean:
	${MAKE} -C ${KERNEL_SOURCE} SUBDIRS=${PWD} clean
endif
