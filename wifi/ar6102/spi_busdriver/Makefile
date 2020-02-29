# if KERNELRELEASE is defined, we've been invoked from the
# kernel build system and can use its language.
ifneq (${KERNELRELEASE},)
obj-m := sdio_busdriver.o
sdio_busdriver-objs := sdio_bus.o sdio_function.o sdio_bus_misc.o sdio_bus_events.o sdio_bus_linux.o
#MY_CFLAGS += -g
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
