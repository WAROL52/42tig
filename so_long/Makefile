NAME = so_long

CC = gcc
CFLAGS = -g -Wall -Wextra -Werror -Imlx

SRCDIR = src
OBJDIR = obj
INCDIR = include

SRC = main.c screen.c map.c utils.c player.c game.c error.c
OBJ = $(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

MLXDIR = minilibx-linux
MLX = $(MLXDIR)/libmlx.a
LIBS = -L$(MLXDIR) -lmlx -lXext -lX11

all: $(NAME)

# Compilation de l'exécutable
$(NAME): $(OBJ) $(MLX)
	$(CC) $(CFLAGS) $(OBJ) $(LIBS) -o $(NAME)

# Compilation des objets
$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) $(CFLAGS) -I$(INCDIR) -c $< -o $@

# Création du répertoire des objets
$(OBJDIR):
	mkdir -p $(OBJDIR)

# Compilation de la MiniLibX
$(MLX):
	@$(MAKE) -C $(MLXDIR)

run:all
	valgrind --leak-check=full ./so_long map1.ber

# Nettoyage des objets et des fichiers compilés
clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)

# Nettoyage complet et recompilation
re: fclean all

# Règles de phony pour éviter les conflits avec des fichiers
.PHONY: all clean fclean re
