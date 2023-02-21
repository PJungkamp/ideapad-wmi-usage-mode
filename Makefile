
KERNELRELEASE ?= $(shell uname -r)
KERNEL_DIR  ?= /lib/modules/$(KERNELRELEASE)/build
PWD := $(shell pwd)

TARGET_MODULE:=ideapad-wmi-usage-mode
obj-m := $(TARGET_MODULE).o

all:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) modules

install:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) modules_install

test:
	gcc test.c -o test

clean:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) clean
