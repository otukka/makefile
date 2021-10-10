
NAME=program

# Define sources
src = src/main.c src/sub/helper.c

# Define include directories
inc = include


obj = $(src:.c=.o)
dep = $(obj:.o=.d)

CFLAGS = -MMD     # generate a dep file in compilation
LDFLAGS = -lm

INC = $(patsubst %,-I%,$(inc))
CFLAGS += $(INC)


# all: release debug


# order matters
include release.mk
include debug.mk



.PHONY: clean
clean:
	rm -rf build





