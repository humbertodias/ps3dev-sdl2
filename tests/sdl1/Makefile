CC = ppu-gcc
CFLAGS = `sdl-config --cflags`
LDFLAGS = `sdl-config --libs`

SRCS = main.c
OBJS = $(SRCS:.c=.o)

.PHONY: main
main: $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm -f $(OBJS) main

