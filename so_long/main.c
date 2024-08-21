#include "so_long.h"

int	exit_game(t_game *game)
{
	if (game->screen->mlx)
	{
		if (game->screen->win)
			mlx_clear_window(game->screen->mlx, game->screen->win);
		mlx_destroy_window(game->screen->mlx, game->screen->win);
		free(game->screen->mlx);
	}
	// if (game->map->cells)
	// 	free(game->map->cells);
	if (game->screen->xpm_wall)
		free(game->screen->xpm_wall);
	if (game->screen->xpm_empty)
		free(game->screen->xpm_empty);
	if (game->screen->xpm_player)
		free(game->screen->xpm_player);
	if (game->screen->xpm_coin)
		free(game->screen->xpm_coin);
	if (game->screen->xpm_exit_close)
		free(game->screen->xpm_exit_close);
	if (game->screen->xpm_exit_open)
		free(game->screen->xpm_exit_open);
	exit(0);
}

int	onkey(int key, t_game *game)
{
	if (key == 65362 || key == 'w' || key == 'W')
		ft_player_move_up(game);
	else if (key == 65364 || key == 'S' || key == 's')
		ft_player_move_down(game);
	else if (key == 65361 || key == 'a' || key == 'A')
		ft_player_move_left(game);
	else if (key == 65363 || key == 'd' || key == 'D')
		ft_player_move_right(game);
	else if (key == 65307)
		exit_game(game);
	return (1);
}

char	*map_read(char *cells, char *filename)
{
	int		fd;
	size_t	bytes_read;

	fd = open(filename, O_RDONLY);
	bytes_read = read(fd, cells, 1024);
	cells[bytes_read] = '\0';
	close(fd);
	return (cells);
}

int	ft_isendwith(char *s, char *with)
{
	int	len_s;
	int	len_w;

	len_s = 0;
	while (s[len_s])
		len_s++;
	len_w = 0;
	while (with[len_w])
		len_w++;
	while (len_w >= 0)
	{
		if (s[len_s] != with[len_w])
			return (0);
		len_s--;
		len_w--;
	}
	return (1);
}

int	main(int argc, char **argv)
{
	t_screen	screen;
	t_map		map;
	t_player	player;
	t_game		game;
	char		cells[1024];

	(void)argc;
	if (!ft_isendwith(argv[1], MAP_FILE_EXT))
	{
		write(2, "Error\n", 6);
		return (0);
	}
	map_read(cells, argv[1]);
	if (cells == NULL || !ft_map_init(&map, cells, &player))
	{
		write(2, "Error\n", 6);
		exit_game(&game);
	}
	if (!ft_screen_init(&screen, map.width, map.height))
	{
		write(2, "Error\n", 6);
		exit_game(&game);
	}
	game.map = &map;
	game.player = &player;
	game.screen = &screen;
	ft_game_render(&game);
	mlx_hook(screen.win, KeyPress, KeyPressMask, onkey, &game);
	mlx_hook(screen.win, DestroyNotify, NoEventMask, exit_game, &game);
	mlx_loop(screen.mlx);
	return (0);
}
