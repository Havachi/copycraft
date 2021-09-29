SRCS = ./src/main.c
OBJS = ${SRCS:.c=.o}
INCS = inc 
LIBS = lib

LIBFLAG = -L$(LIBS)
INCFLAG = -I$(INCS)
CFLAGS = -Wall -Wextra -Werror $(LIBFLAG) $(INCFLAG) 
LFLAGS = -lSDL2 $(LIBFLAG) $(INCFLAG)

NAME = copycraft

.c.o: 
	@echo "Compiling $<"
	@gcc -c $(CFLAGS) $< -o ${<:.c=.o} 

$(NAME): $(OBJS)
	@echo "Making $(NAME)"
	@gcc $(OBJS) -o $(NAME) $(LFLAGS)
all: $(NAME)

clean: 
	@echo "Removing .o files"
	@rm $(OBJS)
fclean: clean
	@echo "Removing old executable"
	@rm $(NAME)

re: fclean all

