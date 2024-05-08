/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+
	+:+     */
/*   By: rrabetsy <marvin@42.fr>                    +#+  +:+
	+#+        */
/*                                                +#+#+#+#+#+
	+#+           */
/*   Created: 2024/03/20 11:52:25 by rrabetsy          #+#    #+#             */
/*   Updated: 2024/03/20 15:47:07 by rrabetsy         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"


int	main(void)
{
	int nbr;
	int c1;
	int c2;
	char *str = "[_%-4d_]\n";
	nbr = -15;
	exemple_c();
	c1 = ft_printf(str, nbr);
	printf("---\n");
	c2 = printf(str, nbr);
	printf("---\n");
	printf("c1:%d|c2:%d\n", c1, c2);
	return (0);
}
