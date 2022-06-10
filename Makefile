PREFIX	= /usr/local
ARCH	= h8300-elf
BINDIR	= $(PREFIX)/BINDIR
ADDNAME	= $(ARCH)-

AR		= $(BINDIR)/$(ADDNAME)ar
AS		= $(BINDIR)/$(ADDNAME)as
CC		= $(BINDIR)/$(ADDNAME)gcc
LD		= $(BINDIR)/$(ADDNAME)ld
NM		= $(BINDIR)/$(ADDNAME)nm
OBJCOPY	= $(BINDIR)/$(ADDNAME)objcopy
OBJDUMP	= $(BINDIR)/$(ADDNAME)objdump
RANLIB	= $(BINDIR)/$(ADDNAME)ranlib
STRIP	= $(BINDIR)/$(ADDNAME)strip

H8WRITE = ../../tools/h8write/h8write

OBJS	= vector.o startup.o mail.o
OBJS	+= lib.o serial.o

