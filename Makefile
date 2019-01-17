############################## COMPILE VAR #####################################

CC			=	gcc
CFLAGS		=	-Wall -Wextra -Werror
#CFLAGS		=	-g
HDIR		=	includes
SRCDIR		=	src
HFLAGS		=	-I $(HDIR)
NAME		=	libftgetopt.a

############################## SOURCES #########################################

LIBFTDIR		=	libft

SRCC			=	ft_getopt.c\
					get_next_option_argument.c\
					get_short_option.c\
					getopt_errors.c\
					getopt_long_errors.c\
					init_getopt.c\
					permute_order.c\
					process_long_option.c\

LIBFTC			=	ft_memset.c\
					ft_strchr.c\
					ft_strcmp.c\
					ft_strlen.c\
					ft_strncmp.c\

ODIR			=	obj
OBJ				=	$(patsubst %.c,%.o,$(LIBFTC))\
					$(patsubst %.c,%.o,$(SRCC))\

vpath			%.o	$(ODIR)
vpath			%.h	$(HDIR)
vpath			%.c	$(SRCDIR)/$(LIBFTDIR)
vpath			%.c	$(SRCDIR)

############################## BUILD ###########################################

all: $(NAME)

$(NAME): $(ODIR) $(OBJ)
	ar rc $@ $(patsubst %.o,$(ODIR)/%.o,$(OBJ))
	ranlib $@

ft_getopt.o: get_next_option_argument.h ft_getopt.h get_short_option.h
get_next_option_argument.o: permute_order.h ft_getopt.h process_long_option.h\
	libft.h
get_short_option.o: ft_getopt.h libft.h getopt_errors.h
getopt_errors.o: ft_getopt.h libft.h
getopt_long_errors.o: getopt_errors.h ft_getopt.h libft.h
init_getopt.o: ft_getopt.h
ft_strcmp.o: libft.h
ft_strncmp.o: libft.h
permute_order.o: ft_getopt.h
process_long_option.o: ft_getopt.h libft.h getopt_errors.h
%.o: %.c
	$(CC) -c $(CFLAGS) $< $(HFLAGS) -o $(ODIR)/$@

$(ODIR):
	mkdir -p $@

############################## CLEANUP #########################################

clean:
	rm -rf $(ODIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
