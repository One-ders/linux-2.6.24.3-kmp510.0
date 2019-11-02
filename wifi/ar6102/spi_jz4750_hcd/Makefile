# if KERNELRELEASE is defined, we've been invoked from the
# kernel build system and can use its language.
ifneq (${KERNELRELEASE},)
obj-m := athspi_jz4755_hcd.o
athspi_jz4755_hcd-objs := jz4755_spi.o ath_spi_hcd.o
MY_CFLAGS +=
#-fdump-ipa-cgraph -fdump-tree-all
ccflags-y += ${MY_CFLAGS}
CC += ${MY_CFLAGS}
# Otherwise we were called directly from the command line.
# Invoke the kernel build system.
  else
#    KERNEL_SOURCE := /usr/src/linux
    KERNEL_SOURCE := /home/anders/mips/dev/ingenic/rebuild/2.6.24.3/linux-2.6.24.3
    PWD := $(shell pwd)

all:
	${MAKE} -C ${KERNEL_SOURCE} M=${PWD} modules

#debug:
#	${MAKE} -C ${KERNEL_SOURCE} SUBDIRS=${PWD} modules EXTRA_CFLAGS="$(MY_CFLAGS)"

#	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules EXTRA_CFLAGS="$(MY_CFLAGS)"

clean:
	${MAKE} -C ${KERNEL_SOURCE} SUBDIRS=${PWD} clean
endif
