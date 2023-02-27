CLIENT = client
SERVER = server

NAME  = $(SERVER) $(CLIENT)

CC = gcc
CFLAGS = -Wall -Wextra -Werror
printf = ft_printf/libftprintf.a

all: $(SERVER) $(CLIENT)

$(NAME): $(SERVER) $(CLIENT)

$(SERVER):
	make -C ./ft_printf
	$(CC) $(CFLAGS) server.c $(printf) -o $@

$(CLIENT):
	make -C ./ft_printf
	$(CC) $(CFLAGS) client.c $(printf) -o $@

clean:
	make fclean -C ./ft_printf
	rm -f server client

fclean: clean

re: fclean all

.PHONY: all clean fclean re
