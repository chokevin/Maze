CC=gcc
CCFLAGS=-m32 -std=c99 -Wall -Werror -pedantic -I.
=-m32 -lcurses
CALC_SOURCES=actions.c calc.c cli_view.c curses_view.c exponent.c symbols.c transitions.c

OBJECTS=$(CALC_SOURCES:.c=.o)

%.o: %.c
	$(CC) $(CCFLAGS) -c $< -o $@

calc: calc.o display.o chrutil.o exponent.o opnd.o presults.o ops.o compute.o
	$(CC) $(CCFLAGS) -lcurses calc.o display.o chrutil.o exponent.o opnd.o presults.o ops.o compute.o -o calc   

calc2: $(OBJECTS)
	$(CC) $(LINKFLAGS) display.o $(OBJECTS) -o calc2

driver1: driver1.o display.o exponent.o chrutil.o
	$(CC) $(CCFLAGS) -lcurses driver1.o display.o exponent.o chrutil.o -o driver1
	
driver2: driver2.o display.o exponent.o chrutil.o opnd.o
	$(CC) $(CCFLAGS) -lcurses opnd.o driver2.o display.o exponent.o chrutil.o -o driver2 -o driver2

driver3: driver3.o compute.o ops.o
	$(CC) $(CCFLAGS) -lcurses opnd.o driver3.o compute.o ops.o display.o exponent.o chrutil.o -o driver3

driver4: driver4.o chrutil.o presults.o
	$(CC) $(CCFLAGS) -lcurses driver4.o chrutil.o presults.o -o driver4


all: driver1 driver2 driver3 driver4 calc

clean:
	cp display.o display.asdfasdf
	rm -rf *.o spec_calc calc a.out driver1 driver2 driver3 driver4
	mv display.asdfasdf display.o
