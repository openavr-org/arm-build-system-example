#
# Example Makefile for handling multiple subdirs that have no
# inter-dependencies.
#

SUBDIRS := nucleo-F091RC
SUBDIRS += nucleo-F429ZI

.PHONY: all clean $(SUBDIRS)

all: $(SUBDIRS)

# Safe for parallel builds with `make -j N`.
$(SUBDIRS):
	@$(MAKE) -C $@

clean:
	-@for d in $(SUBDIRS); do $(MAKE) -C $${d} clean; done
