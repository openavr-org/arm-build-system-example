VERSION_SRC_DIR := $(TOPDIR)/src

INC_DIRS += -I$(TOPDIR)/src
INC_DIRS += -I$(TOPDIR)/../common

SRC_DIRS += $(TOPDIR)/src
SRC_DIRS += $(TOPDIR)/../common

SRC += main.c
SRC += utils.c
SRC += startup_stm32f091xc.s
SRC += sys_init.c
