CC = gcc
CFLAGS = -Wall -I/opt/goinfre/fletamar/homebrew/Cellar/fcgi/2.4.2/include/
LDFLAGS = -L/opt/goinfre/fletamar/homebrew/Cellar/fcgi/2.4.2/lib/ -lfcgi

TARGET = mini_server
SRC = mini_server.c

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(TARGET)

