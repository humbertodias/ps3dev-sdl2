CC = ppu-gcc
CFLAGS = `sdl2-config --cflags`
LDFLAGS = `sdl2-config --libs`

SRCS = main.c
OBJS = $(SRCS:.c=.o)

.PHONY: main
main: $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm -f $(OBJS) main

