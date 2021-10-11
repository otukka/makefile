
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


# order matters
include release.mk # The first targets comes from here, i.e. the default target.
include debug.mk


test: clean release debug run

run:
	@exec $(RELEASE_NAME)
	@exec $(DEBUG_NAME)


.PHONY: clean
clean:
	rm -rf build





