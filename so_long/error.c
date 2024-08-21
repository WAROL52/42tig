#include "so_long.h"

static int	ft_issurrounded_bywalls_x(t_map *map)
{
	int	x;
	int	y;

	y = 0;
	x = 0;
	while (x < map->width)
	{
		if (ft_cell_get(map, x, y) != CELL_WALL)
			return (0);
		x++;
	}
	y = map->height - 1;
	x = 0;
	while (x < map->width)
	{
		if (ft_cell_get(map, x, y) != CELL_WALL)
			return (0);
		x++;
	}
	return (1);
}
static int	ft_issurrounded_bywalls_y(t_map *map)
{
	int	x;
	int	y;

	y = 0;
	x = 0;
	while (y < map->height)
	{
		if (ft_cell_get(map, x, y) != CELL_WALL)
			return (0);
		y++;
	}
	y = 0;
	x = map->width - 1;
	while (y < map->height)
	{
		if (ft_cell_get(map, x, y) != CELL_WALL)
			return (0);
		y++;
	}
	return (1);
}

int	check_all_move(t_map *map, int x, int y)
{
	if (ft_cell_get(map, x, y) == CELL_COIN)
		map->coin_count--;
	if (ft_cell_get(map, x, y) == CELL_EXIT)
		map->exit_count--;
	ft_cell_set(map, x, y, CELL_PLAYER);
	if (ft_isin(ft_cell_get(map, x + 1, y), CELL_PLAY))
		check_all_move(map, x + 1, y);
	if (ft_isin(ft_cell_get(map, x - 1, y), CELL_PLAY))
		check_all_move(map, x - 1, y);
	if (ft_isin(ft_cell_get(map, x, y + 1), CELL_PLAY))
		check_all_move(map, x, y + 1);
	if (ft_isin(ft_cell_get(map, x, y - 1), CELL_PLAY))
		check_all_move(map, x, y - 1);
	return (1);
}

int	check_error(t_map *map, t_player *player)
{
	char	*cells_copy;
	char	*cells;
	int		tmp1;
	int		tmp2;

	(void)cells_copy;
	if (!ft_issurrounded_bywalls_x(map))
		return (0);
	if (!ft_issurrounded_bywalls_y(map))
		return (0);
	if (map->player_count != 1 || map->exit_count != 1 || map->coin_count <= 0)
		return (0);
	tmp1 = 0;
	cells = malloc((map->cell_count + map->height) * sizeof(char));
	while (map->cells[tmp1])
	{
		cells[tmp1] = map->cells[tmp1];
		tmp1++;
	}
	cells[tmp1] = '\0';
	tmp1 = map->coin_count;
	tmp2 = map->exit_count;
	cells_copy = map->cells;
	map->cells = cells;
	check_all_move(map, player->x, player->y);
	free(map->cells);
	map->cells = cells_copy;
	if (map->exit_count != 0 || map->coin_count != 0)
		return (0);
	map->coin_count = tmp1;
	map->exit_count = tmp2;
	return (1);
}
