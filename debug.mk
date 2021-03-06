

DEBUG_DIR = build/debug/
DEBUG_NAME = $(DEBUG_DIR)$(NAME)
DEBUG_OBJS = $(addprefix $(DEBUG_DIR)tmp/, $(obj))
DEBUG_DEPS = $(addprefix $(DEBUG_DIR)tmp/, $(dep))
DEBUG_CFLAGS = -g -O0 -DMESSAGE='"Debug"'
debug: $(DEBUG_NAME)

$(DEBUG_NAME): $(DEBUG_OBJS)
	$(CC) -o $(DEBUG_NAME) $(CFLAGS) $(DEBUG_OBJS) $(DEBUG_CFLAGS) $(LDFLAGS)

$(DEBUG_DIR)tmp/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(DEBUG_CFLAGS) -c -o $@ $<

-include $(DEBUG_DEPS)

