
#include "minilibx-linux/mlx.h"
#include <X11/X.h>
#include <X11/keysym.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define XPM_EMPTY_PATH "./sprites/empty_image.xpm"
#define XPM_WALL_PATH "./sprites/wall_image.xpm"
#define XPM_PLAYER_PATH "./sprites/player_image.xpm"
#define XPM_COIN_PATH "./sprites/coin_image.xpm"
#define XPM_EXITO_PATH "./sprites/exito_image.xpm"
#define XPM_EXITC_PATH "./sprites/exitc_image.xpm"
#define IMG_SIZE 64
#define CELL_PLAY "E0C"
#define MAP_FILE_EXT ".ber"

typedef enum e_celltype
{
	CELL_EMPTY = '0',
	CELL_WALL = '1',
	CELL_PLAYER = 'P',
	CELL_EXIT = 'E',
	CELL_COIN = 'C',
}				t_celltype;

typedef struct s_map
{
	int			width;
	int			height;
	int			player_count;
	int			coin_count;
	int			wall_count;
	int			exit_count;
	int			empty_count;
	int			cell_count;
	char		*cells;
}				t_map;

typedef struct s_player
{
	t_celltype	celltype;
	int			move_count;
	int			x;
	int			y;
}				t_player;

typedef struct s_screen
{
	int			screen_width;
	int			screen_height;
	void		*mlx;
	void		*win;
	void		*xpm_empty;
	void		*xpm_wall;
	void		*xpm_player;
	void		*xpm_coin;
	void		*xpm_exit_open;
	void		*xpm_exit_close;
	int			img_width;
	int			img_height;
}				t_screen;

typedef struct s_game
{
	t_map		*map;
	t_screen	*screen;
	t_player	*player;
}				t_game;

int				ft_screen_init(t_screen *screen, int width, int height);
int				ft_screen_init_xpm(t_screen *screen);
int				ft_screen_put_cell(t_screen *screen, t_celltype celltype, int x,
					int y);
int				ft_map_parse(t_map *map, t_player *player);
int				ft_map_init(t_map *map, char *cells, t_player *player);
void			ft_puts(char *s);
void			ft_putnbr(int nb);
void			ft_map_log(t_map *map);
void			ft_screen_log(t_screen *screen);
void			ft_player_log(t_player *player);
int				ft_game_render(t_game *game);
t_celltype		ft_cell_get(t_map *map, int x, int y);
int				ft_cell_set(t_map *map, int x, int y, t_celltype celltype);
int				ft_player_move_up(t_game *game);
int				ft_player_move_down(t_game *game);
int				ft_player_move_left(t_game *game);
int				ft_player_move_right(t_game *game);
int				check_error(t_map *map, t_player *player);
int				ft_isin(char c, char *s);
