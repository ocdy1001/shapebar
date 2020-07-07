# This snippet has been shmelessly stol^Hborrowed from thestinger's repose Makefile
VERSION = 1.3
GIT_DESC=$(shell test -d .git && git describe --always 2>/dev/null)

ifneq "$(GIT_DESC)" ""
	VERSION=$(GIT_DESC)
endif

CC	?= gcc
CFLAGS += -Wall -std=c99 -Os -DVERSION="\"$(VERSION)\"" -I/usr/include/freetype2
LDFLAGS += -lxcb -lxcb-xinerama -lxcb-randr -lX11 -lX11-xcb -lXft -lfreetype -lz -lfontconfig
CFDEBUG = -g3 -pedantic -Wall -Wunused-parameter -Wlong-long \
          -Wsign-conversion -Wconversion -Wimplicit-function-declaration

EXEC = shapebar
SRCS = shapebar.c
OBJS = ${SRCS:.c=.o}

PREFIX?=/usr
BINDIR=${PREFIX}/bin

all: ${EXEC}

doc: README.pod
	pod2man --section=1 --center="shapebar Manual" --name "shapebar" --release="shapebar $(VERSION)" README.pod > shapebar.1

.c.o:
	${CC} ${CFLAGS} -o $@ -c $<

${EXEC}: ${OBJS}
	${CC} -o ${EXEC} ${OBJS} ${LDFLAGS}

debug: ${EXEC}
debug: CC += ${CFDEBUG}

clean:
	rm -f ./*.o ./*.1
	rm -f ./${EXEC}

install: lemonbar doc
	install -D -m 755 shapebar ${DESTDIR}${BINDIR}/shapebar
	install -D -m 644 shapebar.1 ${DESTDIR}${PREFIX}/share/man/man1/shapebar.1

uninstall:
	rm -f ${DESTDIR}${BINDIR}/shapebar
	rm -f $(DESTDIR)$(PREFIX)/share/man/man1/shapebar.1

.PHONY: all debug clean install
