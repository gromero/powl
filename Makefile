CC=gcc
CFLAGS=
LDFLAGS=-g -lm -static

%.o:	%.c
	$(CC) $(CFLAGS) $< -c -o $@ $(LDFLAGS) $(EXTF)

all:	powl_26.o powl_27.o
	$(CC) $(CFLAGS) powl_26.o -o powl_26 $(LDFLAGS) $(EXTF)
	$(CC) $(CFLAGS) powl_27.o -o powl_27 $(LDFLAGS) $(EXTF)

clean:
	rm -fr powl_26.o powl_26
	rm -fr powl_27.o powl_27
	rm -fr *.functions

view:
	objdump -d ./powl_26  | fgrep ">:"  | sort -u | awk  '{print $$2}' > powl_26.functions
	objdump -d ./powl_27  | fgrep ">:"  | sort -u | awk  '{print $$2}' > powl_27.functions
	vimdiff powl_26.functions powl_27.functions
