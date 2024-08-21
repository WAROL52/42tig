#include "so_long.h"

void	ft_puts(char *s)
{
	int	len;

	len = 0;
	while (s[len])
		len++;
	if (len != 0)
		write(1, s, len);
}

void	ft_putnbr(int nb)
{
	char	c;

	if (nb < 0)
	{
		write(1, "-", 1);
		nb = -nb;
	}
	if (nb >= 10)
	{
		ft_putnbr(nb / 10);
		nb = nb % 10;
	}
	c = nb + 48;
	if (nb < 10)
		write(1, &c, 1);
}
t_celltype	ft_cell_get(t_map *map, int x, int y)
{
	if (x < 0 || x >= map->width)
		return (0);
	if (y < 0 || y >= map->height)
		return (0);
	return (map->cells[map->width * y + x + y]);
}
int	ft_cell_set(t_map *map, int x, int y, t_celltype celltype)
{
	if (x < 0 || x >= map->width)
		return (0);
	if (y < 0 || y >= map->height)
		return (0);
	map->cells[map->width * y + x + y] = celltype;
	return (1);
}
int	ft_isin(char c, char *s)
{
	int	i;

	i = 0;
	while (s[i])
	{
		if (s[i] == c)
			return (1);
		i++;
	}
	return (0);
}
