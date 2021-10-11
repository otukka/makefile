

RELEASE_DIR = build/release/
RELEASE_NAME = $(RELEASE_DIR)$(NAME)
RELEASE_OBJS = $(addprefix $(RELEASE_DIR)tmp/, $(obj))
RELEASE_DEPS = $(addprefix $(RELEASE_DIR)tmp/, $(dep))
RELEASE_CFLAGS = -O3 -DMESSAGE='"Release"'
release: $(RELEASE_NAME)

$(RELEASE_NAME): $(RELEASE_OBJS)
	$(CC) -o $(RELEASE_NAME) $(CFLAGS) $(RELEASE_OBJS) $(RELEASE_CFLAGS) $(LDFLAGS)

$(RELEASE_DIR)tmp/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(RELEASE_CFLAGS) -c -o $@ $<

-include $(RELEASE_DEPS)

