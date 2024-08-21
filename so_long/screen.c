#include "so_long.h"

int	ft_screen_init(t_screen *screen, int width, int height)
{
	screen->xpm_coin = 0;
	screen->xpm_empty = 0;
	screen->xpm_player = 0;
	screen->xpm_wall = 0;
	screen->xpm_exit_close = 0;
	screen->xpm_exit_open = 0;
	screen->mlx = 0;
	screen->win = 0;
	screen->mlx = mlx_init();
	if (!screen->mlx)
		return (0);
	if (!ft_screen_init_xpm(screen))
		return (0);
	screen->screen_width = width * screen->img_width;
	screen->screen_height = height * screen->img_height;
	screen->win = mlx_new_window(screen->mlx, screen->screen_width,
			screen->screen_height, "So long");
	if (!screen->win)
		return (0);
	return (1);
}

int	ft_screen_init_xpm(t_screen *screen)
{
	screen->xpm_coin = mlx_xpm_file_to_image(screen->mlx, XPM_COIN_PATH,
			&screen->img_width, &screen->img_height);
	if (!screen->xpm_coin)
		return (0);
	screen->xpm_empty = mlx_xpm_file_to_image(screen->mlx, XPM_EMPTY_PATH,
			&screen->img_width, &screen->img_height);
	if (!screen->xpm_empty)
		return (0);
	screen->xpm_player = mlx_xpm_file_to_image(screen->mlx, XPM_PLAYER_PATH,
			&screen->img_width, &screen->img_height);
	if (!screen->xpm_player)
		return (0);
	screen->xpm_wall = mlx_xpm_file_to_image(screen->mlx, XPM_WALL_PATH,
			&screen->img_width, &screen->img_height);
	if (!screen->xpm_wall)
		return (0);
	screen->xpm_exit_close = mlx_xpm_file_to_image(screen->mlx, XPM_EXITC_PATH,
			&screen->img_width, &screen->img_height);
	if (!screen->xpm_exit_close)
		return (0);
	screen->xpm_exit_open = mlx_xpm_file_to_image(screen->mlx, XPM_EXITO_PATH,
			&screen->img_width, &screen->img_height);
	if (!screen->xpm_exit_open)
		return (0);
	return (1);
}

int	ft_screen_put_cell(t_screen *screen, t_celltype celltype, int x, int y)
{
	x = screen->img_width * x;
	y = screen->img_height * y;
	if (celltype == CELL_COIN)
		return (mlx_put_image_to_window(screen->mlx, screen->win,
				screen->xpm_coin, x, y));
	if (celltype == CELL_EMPTY)
		return (mlx_put_image_to_window(screen->mlx, screen->win,
				screen->xpm_empty, x, y));
	if (celltype == CELL_WALL)
		return (mlx_put_image_to_window(screen->mlx, screen->win,
				screen->xpm_wall, x, y));
	if (celltype == CELL_PLAYER)
		return (mlx_put_image_to_window(screen->mlx, screen->win,
				screen->xpm_player, x, y));
	if (celltype == CELL_EXIT)
		return (mlx_put_image_to_window(screen->mlx, screen->win,
				screen->xpm_exit_close, x, y));
	return (-1);
}
void	ft_screen_log(t_screen *screen)
{
	write(1, "screen_width: ", 14);
	ft_putnbr(screen->screen_width);
	write(1, "\nscreen_height: ", 16);
	ft_putnbr(screen->screen_height);
	ft_puts("\n");
	/*ft_puts("screen->mlx : ");
	ft_putnbr(screen->mlx);
	ft_puts("screen->win: ");
	ft_putnbr(screen->win);*/
}
