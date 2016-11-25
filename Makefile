CC=gcc
CFLAGS=-mlong-double-64
LDFLAGS=-g -lm -static

%.o:	%.c
	$(CC) $(CFLAGS) $< -c -o $@ $(LDFLAGS)

all:	powl_26.o powl_27.o
	$(CC) $(CFLAGS) powl_26.o -o powl_26 $(LDFLAGS)
	$(CC) $(CFLAGS) powl_27.o -o powl_27 $(LDFLAGS)

clean:
	rm -fr powl_26.o powl_26
	rm -fr powl_27.o powl_27
	rm -fr *.functions

view:
	objdump -d ./powl_26  | fgrep ">:"  | sort -u | awk  '{print $$2}' > powl_26.functions
	objdump -d ./powl_27  | fgrep ">:"  | sort -u | awk  '{print $$2}' > powl_27.functions
	vimdiff powl_26.functions powl_27.functions
