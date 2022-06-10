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

TARGET = kzload

CFLAGS = -Wall -mh -nostdinc -nostdlib -fno-builtin
#CFLAGS += -mint32
CFLAGS += -I
#CFLAGS += -g
CFLAGS += -Os
CFLAGS += DKZLOAD

LFLAGS = -static -T ld.scr -L.

.SUFFIXES: .c .o
.SUFFIXES: .s .o

all :			$(TARGET)

$(TARGET) :		$(OBJS)
				$(CC) $(OBJS) -o $(TARGET) $(CFLAGS) $(LFLAGS)
				cp $(TARGET) $(TARGET).elf
				$(STRIP) $(TARGET)

.c.o :			$<
				$(CC) -c $(CFLAGS) $<

.s.o :			$<
				$(CC) -c $(CFLAGS) $<

$(TARGET).mot	$(TARGET)
				$(OBJCOPY) -O srec $(TARGET) $(TARGET).mot

image :			$(TARGET).mot

write :			$(TARGET).mot
				$(H8WRITE) -3069 -f20 $(TARGET).mot $(H8WRITE_SERDEV)

clean :
				rm -f $(OBJS) $(TARGET) $(TARGET).elf $(TARGET).mot