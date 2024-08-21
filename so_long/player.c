#include "so_long.h"

void	ft_player_log(t_player *player)
{
	ft_puts("x = ");
	ft_putnbr(player->x);
	ft_puts("\ny = ");
	ft_putnbr(player->y);
	ft_puts("\n");
}

int	ft_player_move_up(t_game *game)
{
	t_celltype	up;

	if (game->player->y <= 0)
		return (0);
	up = ft_cell_get(game->map, game->player->x, game->player->y - 1);
	if (up == CELL_EXIT && !game->map->coin_count && game->map->exit_count--)
		up = CELL_EMPTY;
	if (up == CELL_COIN)
	{
		game->map->coin_count--;
		up = CELL_EMPTY;
	}
	if (up == CELL_EMPTY)
	{
		game->player->move_count++;
		ft_cell_set(game->map, game->player->x, game->player->y, CELL_EMPTY);
		game->player->y--;
		ft_cell_set(game->map, game->player->x, game->player->y, CELL_PLAYER);
		ft_game_render(game);
	}
	return (0);
}
int	ft_player_move_down(t_game *game)
{
	t_celltype	down;

	if (game->player->y >= game->map->height)
		return (0);
	down = ft_cell_get(game->map, game->player->x, game->player->y + 1);
	if (down == CELL_EXIT && !game->map->coin_count && game->map->exit_count--)
		down = CELL_EMPTY;
	if (down == CELL_COIN)
	{
		game->map->coin_count--;
		down = CELL_EMPTY;
	}
	if (down == CELL_EMPTY)
	{
		game->player->move_count++;
		ft_cell_set(game->map, game->player->x, game->player->y, CELL_EMPTY);
		game->player->y++;
		ft_cell_set(game->map, game->player->x, game->player->y, CELL_PLAYER);
		ft_game_render(game);
	}
	return (0);
}
int	ft_player_move_left(t_game *game)
{
	t_celltype	right;

	if (game->player->x <= 0)
		return (0);
	right = ft_cell_get(game->map, game->player->x - 1, game->player->y);
	if (right == CELL_EXIT && !game->map->coin_count && game->map->exit_count--)
		right = CELL_EMPTY;
	if (right == CELL_COIN)
	{
		game->map->coin_count--;
		right = CELL_EMPTY;
	}
	if (right == CELL_EMPTY)
	{
		game->player->move_count++;
		ft_cell_set(game->map, game->player->x, game->player->y, CELL_EMPTY);
		game->player->x--;
		ft_cell_set(game->map, game->player->x, game->player->y, CELL_PLAYER);
		ft_game_render(game);
	}
	return (0);
}
int	ft_player_move_right(t_game *game)
{
	t_celltype	left;

	if (game->player->x >= game->map->width)
		return (0);
	left = ft_cell_get(game->map, game->player->x + 1, game->player->y);
	if (left == CELL_EXIT && !game->map->coin_count && game->map->exit_count--)
		left = CELL_EMPTY;
	if (left == CELL_COIN)
	{
		game->map->coin_count--;
		left = CELL_EMPTY;
	}
	if (left == CELL_EMPTY)
	{
		game->player->move_count++;
		ft_cell_set(game->map, game->player->x, game->player->y, CELL_EMPTY);
		game->player->x++;
		ft_cell_set(game->map, game->player->x, game->player->y, CELL_PLAYER);
		ft_game_render(game);
	}
	return (0);
}
