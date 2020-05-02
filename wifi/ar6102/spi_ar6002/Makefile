# if KERNELRELEASE is defined, we've been invoked from the
# kernel build system and can use its language.
ifneq (${KERNELRELEASE},)
obj-m := spi_ar6002.o
spi_ar6002-objs := hif.o ar6k.o ar6k_events.o htc_send.o htc_recv.o htc_services.o htc.o bmi.o ar6000_drv.o
#CFLAGS_ar6000_drv.o :=
MY_CFLAGS += -DDEBUG -DSEND_EVENT_TO_APP -DCONFIG_HOST_TCMD_SUPPORT -DFAKE_EEPROM_USED -DUSER_KEYS
ccflags-y += ${MY_CFLAGS} -Iwifi/ar6102/include -Iwifi/ar6102/athInclude/include -Iwifi/ar6102/spi_ar6002/include -Iwifi/ar6102/spi_jz4750_hcd
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
