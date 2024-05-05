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
	char *str = ">[%1s]\n";
	nbr = 0;
	exemple_c();
	c1 = ft_printf(str, "");
	printf("---\n");
	c2 = printf(str, "");
	printf("---\n");
	printf("c1:%d|c2:%d\n", c1, c2);
	return (0);
}
