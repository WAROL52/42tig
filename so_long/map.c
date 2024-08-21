#include "so_long.h"

int	ft_map_init(t_map *map, char *cells, t_player *player)
{
	if (!cells)
		return (0);
	map->width = 0;
	map->height = 0;
	map->coin_count = 0;
	map->empty_count = 0;
	map->exit_count = 0;
	map->player_count = 0;
	map->wall_count = 0;
	map->cells = cells;
	map->cell_count = 0;
	player->move_count = 0;
	if (!ft_map_parse(map, player) || !check_error(map, player))
		return (0);
	if (map->cell_count != (map->width * map->height))
		return (0);
	return (1);
}
static int	ft_cell_count(t_map *map, t_celltype celltype)
{
	map->cell_count++;
	if (celltype == CELL_EMPTY || celltype == CELL_COIN)
	{
		if (celltype == CELL_EMPTY)
			map->empty_count++;
		else
			map->coin_count++;
		return (1);
	}
	if (celltype == CELL_EXIT)
	{
		map->exit_count++;
		return (1);
	}
	if (celltype == CELL_PLAYER)
	{
		map->player_count++;
		return (1);
	}
	if (celltype == CELL_WALL)
	{
		map->wall_count++;
		return (1);
	}
	return (0);
}

int	ft_map_parse(t_map *map, t_player *player)
{
	int	i;

	i = 0;
	while (map->cells[i])
	{
		if (map->cells[i] == '\n')
		{
			map->height++;
			if (map->width == 0)
				map->width = i;
			else if ((i - map->height + 1) % map->width != 0)
				return (0);
		}
		else
		{
			if (!ft_cell_count(map, map->cells[i]))
				return (0);
			if (map->cells[i] == CELL_PLAYER)
			{
				player->x = (i - map->height) - map->height * map->width;
				player->y = map->height;
			}
		}
		i++;
	}
	map->height++;
	return (1);
}
void	ft_map_log(t_map *map)
{
	ft_puts("Cells :\n");
	ft_puts(map->cells);
	ft_puts("\nMap width :");
	ft_putnbr(map->width);
	ft_puts("\nMap height :");
	ft_putnbr(map->height);
	ft_puts("\ncoin_count :");
	ft_putnbr(map->coin_count);
	ft_puts("\nempty_count :");
	ft_putnbr(map->empty_count);
	ft_puts("\nexit_count :");
	ft_putnbr(map->exit_count);
	ft_puts("\nplayer_count :");
	ft_putnbr(map->player_count);
	ft_puts("\nwall_count :");
	ft_putnbr(map->wall_count);
	ft_puts("\ncell_count :");
	ft_putnbr(map->cell_count);
	write(1, "\n", 1);
}
