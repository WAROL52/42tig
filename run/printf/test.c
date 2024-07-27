/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrabetsy <rrabetsy@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/04/15 18:41:41 by rrabetsy          #+#    #+#             */
/*   Updated: 2024/05/09 15:28:42 by rrabetsy         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

void	printparam_s(char *name, char *str, char *s)
{
	ft_printf("%s(\"", name);
	while (*str)
		(ft_printf("%c", *str), str++);
	ft_printf("\",\"%s\"); //", s);
}
void	runprintf_s(char *str, char *s)
{
	char	*cpstr;
	char	out[1024];
	int		wcount;

	cpstr = str;
	wcount = sprintf(out, str, s);
	printparam_s("\n   printf", str, s);
	ft_printf("|%s|[%d]\n", out, wcount);
}
void	printparam(char *name, char *str, int d)
{
	ft_printf("%s(\"", name);
	while (*str)
		(ft_printf("%c", *str), str++);
	ft_printf("\",%d); //", d);
}
void	runprintf(char *str, int d)
{
	char	*cpstr;
	char	out[1024];
	int		wcount;

	cpstr = str;
	wcount = sprintf(out, str, d);
	printparam("\n   printf", str, d);
	ft_printf("|%s|[%d]\n", out, wcount);
}
int	print_d(char *str, int d)
{
	int	wcount;

	runprintf(str, d);
	printparam("ft_printf", str, d);
	ft_printf("|");
	wcount = ft_printf(str, d);
	ft_printf("|[%d]\n", wcount);
	return (1);
}
int	print_s(char *str, char *s)
{
	int	wcount;

	runprintf_s(str, s);
	printparam_s("ft_printf", str, s);
	ft_printf("|");
	wcount = ft_printf(str, s);
	ft_printf("|[%d]\n", wcount);
	return (1);
}
void	TEST(int num, int isok)
{
	ft_printf("<%d>\n", num);
}
void	test_minus_d(void)
{
	TEST(0, print_d(" %.2d ", 0));
	TEST(30, print_d(" %-1d ", 0));
	TEST(31, print_d(" %-2d ", -1));
	TEST(32, print_d(" %-3d ", 1));
	TEST(33, print_d(" %-4d ", 9));
	TEST(34, print_d(" %-1d ", 10));
	TEST(35, print_d(" %-2d ", 11));
	TEST(36, print_d(" %-3d ", 15));
	TEST(37, print_d(" %-4d ", 16));
	TEST(38, print_d(" %-5d ", 17));
	TEST(39, print_d(" %-1d ", 99));
	TEST(40, print_d(" %-2d ", 100));
	TEST(41, print_d(" %-3d ", 101));
	TEST(42, print_d(" %-1d ", -9));
	TEST(43, print_d(" %-2d ", -10));
	TEST(44, print_d(" %-3d ", -11));
	TEST(45, print_d(" %-4d ", -14));
	TEST(46, print_d(" %-5d ", -15));
	TEST(47, print_d(" %-6d ", -16));
	TEST(48, print_d(" %-1d ", -99));
	TEST(49, print_d(" %-2d ", -100));
	TEST(50, print_d(" %-3d ", -101));
	// TEST(51, print_d(" %-9d ", INT_MAX));
	// TEST(52, print_d(" %-10d ", INT_MIN));
	// TEST(53, print_d(" %-11d ", LONG_MAX));
	// TEST(54, print_d(" %-12d ", LONG_MIN));
	// TEST(55, print_d(" %-13d ", UINT_MAX));
	// TEST(56, print_d(" %-14d ", ULONG_MAX));
	// TEST(57, print_d(" %-15d ", 9223372036854775807LL));
}
void	test_minus_x(void)
{
	// TEST(116, print_d(" %-1x ", 0));
	// TEST(117, print_d(" %-2x ", -1));
	TEST(118, print_d("_%-3x_", 1));
	TEST(119, print_d(" %-4x ", 9));
	TEST(120, print_d(" %-1x ", 10));
	TEST(121, print_d(" %-2x ", 11));
	TEST(122, print_d(" %-3x ", 15));
	TEST(123, print_d(" %-4x ", 16));
	TEST(124, print_d(" %-5x ", 17));
	TEST(125, print_d(" %-1x ", 99));
	TEST(126, print_d(" %-2x ", 100));
	TEST(127, print_d(" %-3x ", 101));
	TEST(128, print_d(" %-1x ", -9));
	TEST(129, print_d(" %-2x ", -10));
	TEST(130, print_d(" %-3x ", -11));
	TEST(131, print_d(" %-4x ", -14));
	TEST(132, print_d(" %-5x ", -15));
	TEST(133, print_d(" %-6x ", -16));
	TEST(134, print_d(" %-1x ", -99));
	TEST(135, print_d(" %-2x ", -100));
	TEST(136, print_d(" %-3x ", -101));
	// TEST(137, print_d(" %-9x ", INT_MAX));
	// TEST(138, print_d(" %-10x ", INT_MIN));
	// TEST(139, print_d(" %-11x ", LONG_MAX));
	// TEST(140, print_d(" %-12x ", LONG_MIN));
	// TEST(141, print_d(" %-13x ", UINT_MAX));
	// TEST(142, print_d(" %-14x ", ULONG_MAX));
	// TEST(143, print_d(" %-15x ", 9223372036854775807LL));
}
void	test_minus_0(void)
{
	// TEST(86, print_d(" %01x ", 0));
	// TEST(87, print_d(" %02x ", -1));
	TEST(88, print_d(" %03x ", 1));
	TEST(89, print_d(" %04x ", 9));
	TEST(90, print_d(" %01x ", 10));
	TEST(91, print_d(" %02x ", 11));
	TEST(92, print_d(" %03x ", 15));
	TEST(93, print_d(" %04x ", 16));
	TEST(94, print_d(" %05x ", 17));
	TEST(95, print_d(" %01x ", 99));
	TEST(96, print_d(" %02x ", 100));
	TEST(97, print_d(" %03x ", 101));
	TEST(98, print_d(" %01x ", -9));
	TEST(99, print_d(" %02x ", -10));
	TEST(100, print_d(" %03x ", -11));
	TEST(101, print_d(" %04x ", -14));
	TEST(102, print_d(" %05x ", -15));
	TEST(103, print_d(" %06x ", -16));
	TEST(104, print_d(" %01x ", -99));
	TEST(105, print_d(" %02x ", -100));
	TEST(106, print_d(" %03x ", -101));
}
void	test_s(void)
{
	// TEST(1, print_s("%.s", ""));
	// TEST(2, print_s(" %.1s", ""));
	// TEST(3, print_s("%.1s ", ""));
	// TEST(4, print_s(" %.s ", ""));
	TEST(5, print_s("[%3.2s]", NULL));
	// TEST(6, print_s(" %.2s %.1s ", "", "-"));
	// TEST(7, print_s(" %.3s %.2s ", " - ", ""));
	// TEST(8, print_s(" %.1s %.2s %.3s %.4s ", " - ", "", "4", ""));
	// TEST(9, print_s(" %.2s %.3s %.4s %.5s %.1s ", " - ", "", "4", "", "2 "));
}
void	test_dot_d(void)
{
	TEST(10, print_d("%-10.5d", 10));
	TEST(11, print_d("%-10.5d", 5000));
	// TEST(12, print_d(" %.2d ", 1));
	// TEST(13, print_d(" %.1d ", 9));
	// TEST(14, print_d(" %.2d ", 10));
	// TEST(15, print_d(" %.3d ", 11));
	// TEST(16, print_d(" %.4d ", 15));
	// TEST(17, print_d(" %.5d ", 16));
	// TEST(18, print_d(" %.6d ", 17));
	// TEST(19, print_d(" %.1d ", 99));
	// TEST(20, print_d(" %.2d ", 100));
	// TEST(21, print_d(" %.3d ", 101));
	// TEST(22, print_d(" %.1d ", -9));
	// TEST(23, print_d(" %.2d ", -10));
	// TEST(24, print_d(" %.3d ", -11));
	// TEST(25, print_d(" %.4d ", -14));
	// TEST(26, print_d(" %.1d ", -15));
	// TEST(27, print_d(" %.2d ", -16));
	// TEST(28, print_d(" %.3d ", -99));
	// TEST(29, print_d(" %.3d ", -100));
	// TEST(30, print_d(" %.4d ", -101));
}