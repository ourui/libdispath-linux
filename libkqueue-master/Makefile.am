
# FIXME - Only supports Linux for now

lib_LTLIBRARIES = libkqueue.la
kqincludedir = $(includedir)/kqueue/sys
kqinclude_HEADERS = include/sys/event.h
dist_man_MANS = kqueue.2

libkqueue_la_CFLAGS = -I./src/common -I./include -Wall -Wextra -Wno-missing-field-initializers -Werror -g -O2 -std=c99 -D_XOPEN_SOURCE=600 -fvisibility=hidden

libkqueue_la_SOURCES = \
       src/common/filter.c \
       src/common/knote.c \
       src/common/map.c \
       src/common/kevent.c \
       src/common/kqueue.c \
       src/posix/platform.c \
       src/posix/platform.h \
       src/linux/platform.c \
       src/linux/read.c \
       src/linux/write.c \
       src/linux/user.c \
       src/linux/vnode.c \
       src/linux/signal.c \
       src/linux/timer.c \
       src/common/alloc.h \
       src/common/debug.h \
       src/common/private.h \
       src/common/queue.h \
       src/common/tree.h \
       src/linux/platform.h

libkqueue_la_LIBADD = -lpthread -lrt

pkgconfigdir=$(libdir)/pkgconfig
pkgconfig_DATA=libkqueue.pc

check_PROGRAMS = kqtest

TESTS = kqtest

kqtest_SOURCES = \
       test/main.c \
       test/kevent.c \
       test/test.c \
       test/proc.c \
       test/read.c \
       test/signal.c \
       test/timer.c \
       test/vnode.c \
       test/user.c \
       test/common.h

kqtest_CFLAGS = -g -O0 -Wall -Werror -I./include -I./test

kqtest_LDADD = -lpthread -lrt libkqueue.la


