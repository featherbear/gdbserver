CC ?= gcc
prom = gdbserver
obj = gdbserver.o utils.o packets.o signals.o
cflags = -std=gnu99

$(prom): $(obj)
	$(CC) $(cflags) -o $(prom) $(obj)

gdbserver.o : gdbserver.c arch.h utils.h packets.h gdb_signals.h
	$(CC) $(cflags) -c $< -o $@

signals.o : signals.c gdb_signals.h gdb/signals.h gdb/signals.def
	$(CC) $(cflags) -c $< -o $@

%.o: %.c
	$(CC) $(cflags) -c $< -o $@
