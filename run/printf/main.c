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


void	print_d(char *str, int d);
void	test_minus_d(void);
void	test_minus_x(void);
void	test_minus_0(void);
void	test_s(void);
void	test_dot_d(void);

int	main(void)
{
	// test_minus_d();
	// test_minus_x();
	// test_minus_0();
	// test_s();
	// test_dot_d();
	int nbr;
	nbr = 10;

	int r=ft_printf(" un deux @{ b; i; u; inv; }: trois  tgr[%#X] {/}45654654 \n",nbr);
	int r2=printf(" un deux trois [%#X] \n", nbr);
	printf("r:%d r2:%d\n",r,r2);
	return (0);
}
