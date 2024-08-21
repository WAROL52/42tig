#include "so_long.h"

int	ft_game_render(t_game *game)
{
	static int	old_move_count = 0;
	int			x;
	int			y;

	x = 0;
	y = 0;
	if (!game->map->exit_count)
	{
		exit(0);
	}
	if (old_move_count != game->player->move_count)
	{
		old_move_count = game->player->move_count;
		ft_putnbr(game->player->move_count);
		write(1, "\n", 1);
	}
	while (y < game->map->height)
	{
		x = 0;
		while (x < game->map->width)
		{
			if (ft_cell_get(game->map, x, y) == CELL_WALL)
				ft_screen_put_cell(game->screen, CELL_WALL, x, y);
			if (ft_cell_get(game->map, x, y) == CELL_COIN)
				ft_screen_put_cell(game->screen, CELL_COIN, x, y);
			if (ft_cell_get(game->map, x, y) == CELL_EMPTY)
				ft_screen_put_cell(game->screen, CELL_EMPTY, x, y);
			if (ft_cell_get(game->map, x, y) == CELL_PLAYER)
				ft_screen_put_cell(game->screen, CELL_PLAYER, x, y);
			if (ft_cell_get(game->map, x, y) == CELL_EXIT)
				ft_screen_put_cell(game->screen, CELL_EXIT, x, y);
			x++;
		}
		y++;
	}
	return (1);
}
