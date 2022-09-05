SCRIPTS_DIR=../../scripts/kernel
DEFAULT_HOST!=$(SCRIPTS_DIR)/default-host.sh
#DEFAULT_HOST=i386
HOST?=DEFAULT_HOST
HOSTARCH!=$(SCRIPTS_DIR)/target-triplet-to-arch.sh $(HOST)
#HOSTARCH=i386

CFLAGS?=-O2 -g
CPPFLAGS?=
LDFLAGS?=
LIBS?=

DESTDIR?=
PREFIX?=/usr/local
EXEC_PREFIX?=$(PREFIX)
INCLUDEDIR?=$(PREFIX)/include
LIBDIR?=$(EXEC_PREFIX)/lib

CFLAGS:=$(CFLAGS) -ffreestanding -Wall -Wextra
CPPFLAGS:=$(CPPFLAGS) # -D__is_libc
LIBK_CFLAGS:=$(CFLAGS)
LIBK_CPPFLAGS:=$(CPPFLAGS) #-D__is_libk

ARCHDIR=arch/$(HOSTARCH)

include $(ARCHDIR)/make.config

LIBS:=$(LIBS)-lk -lgcc
CFLAGS:=$(CFLAGS) $(ARCH_CFLAGS) $(LIBS)
CPPFLAGS:=$(CPPFLAGS) $(ARCH_CPPFLAGS)
LIBK_CFLAGS:=$(LIBK_CFLAGS) $(KERNEL_ARCH_CFLAGS)
LIBK_CPPFLAGS:=$(LIBK_CPPFLAGS) $(KERNEL_ARCH_CPPFLAGS)
# LIBS:=$(LIBS) -lk -lgcc

FREEOBJS=\
$(ARCH_FREEOBJS) \
ssp/ssptest.o \
test/runtests.o \

HOSTEDOBJS=\
$(ARCH_HOSTEDOBJS) \

OBJS=\
$(FREEOBJS) \
$(HOSTEDOBJS) \

LIBK_OBJS=$(FREEOBJS:.o=.libtest.o)

#BINARIES=libc.a libk.a # Not ready for libc yet.
BINARIES=libtest.a

.PHONY: all clean install install-headers install-libs
.SUFFIXES: .o .libtest.o .c .S

all: $(BINARIES)

# TODO: Linking libc/libk/string.libk.o does not work unless string object file itself is manually added to libtest
# There should be a better way to do this
libtest.a: $(OBJS)
	cp ../sysroot/usr/lib/libk.a libk.a
	$(AR) x libk.a
	$(AR) rcs $@ $(OBJS) *.o
	rm libk.a
	rm *.o


#libk.a: $(LIBK_OBJS)
#	$(AR) rcs $@ $(LIBK_OBJS)

.c.o:
	$(CC) -MD -c $< -o $@ -std=gnu11 $(CFLAGS) $(CPPFLAGS)

.c.S:
	$(CC) -MD -c $< -o $@ $(CFLAGS) $(CPPFLAGS)

.c.libtest.o:
	$(CC) -MD -c $< -o $@ -std=gnu11 $(LIBK_CFLAGS) $(LIBK_CPPFLAGS)

.S.libtest.o:
	$(CC) -MD -c $< -o $@ $(LIBK_CFLAGS) $(LIBK_CPPFLAGS)

clean:
	rm -f $(BINARIES) *.a libtest.a
	rm -f $(OBJS) $(LIBK_OBJS) *.o */*.o */*/*.o
	rm -f $(OBJS:.o=.d) $(LIBK_OBJS:.o=.d) *.d */*.d */*/*.d

install: install-headers install-libs

install-headers:
	mkdir -p $(DESTDIR)$(INCLUDEDIR)
	cp -R --preserve=timestamps include/. $(DESTDIR)$(INCLUDEDIR)/.

install-libs: $(BINARIES)
	mkdir -p $(DESTDIR)$(LIBDIR)
	cp $(BINARIES) $(DESTDIR)$(LIBDIR)

-include $(OBJS:.o=.d)
-include $(LIBK_OBJS:.o=.d)
