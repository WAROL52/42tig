/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrabetsy <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/20 11:52:25 by rrabetsy          #+#    #+#             */
/*   Updated: 2024/03/20 15:47:07 by rrabetsy         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

const char	*single_character = "\
--------------------------\n\
single character:%c, %c, %c\n\
--------------------------\n\
";

const char	*string = "\
--------------------------\n\
string:%s, %s, %s\n\
--------------------------\n\
";
const char	*pointer = "\
--------------------------\n\
pointer:%p, %p, %p\n\
--------------------------\n\
";
const char	*decimal = "\
--------------------------\n\
decimal:%d, %d, %d\n\
--------------------------\n\
";
const char	*integer = "\
--------------------------\n\
integer:%i, %i, %i\n\
--------------------------\n\
";
const char	*unsigned_decima = "\
--------------------------\n\
unsigned_decimal:%u, %u, %u\n\
--------------------------\n\
";
const char	*hexadecimal_lowercase = "\
--------------------------\n\
hexadecimal_lowercase:%x, %x, %x\n\
--------------------------\n\
";
const char	*hexadecimal_uppercase = "\
--------------------------\n\
hexadecimal_uppercase:%X, %X, %X\n\
--------------------------\n\
";
void	printCount(char *name, int o, int ft)
{
	printf("%s-COUNT:(o:%d - ft:%d)\n", name, o, ft);
}
void	printVertivalSpace(void)
{
	printf("\n");
}
void	ft_test_single_character(void)
{
	int	count;
	int	count2;

	count = printf(single_character, 'a', 'A' + 1, 256 + 'z');
	count2 = ft_printf(single_character, 'a', 'A' + 1, 256 + 'z');
	printCount("single_character", count, count2);
	printVertivalSpace();
}
void	ft_test_single_string(void)
{
	int	count;
	int	count2;

	count = printf(string, "UN", "deux", "33333");
	count2 = ft_printf(string, "UN", "deux", "33333");
	printCount("string", count, count2);
	printVertivalSpace();
}
void	ft_test_single_pointer(void)
{
	int		p1;
	char	p2;
	long	p3;
	int		count;
	int		count2;

	p1 = 0;
	p2 = '0';
	p3 = 123;
	count = printf(pointer, &p1, &p2, &p3);
	count2 = ft_printf(pointer, &p1, &p2, &p3);
	printCount("pointer", count, count2);
	printVertivalSpace();
}
void	ft_test_decimal(void)
{
	char					c;
	long long int			lli;
	unsigned long long int	ulli;
	int						count;
	int						count2;

	c = '0';
	lli = LLONG_MAX - 1;
	ulli = 987654321;
	count = printf(decimal, c, lli, ulli);
	count2 = ft_printf(decimal, c, lli, ulli);
	printCount("decimal", count, count2);
	printVertivalSpace();
}
void	ft_test_integer(void)
{
	char					c;
	long long int			lli;
	unsigned long long int	ulli;
	int						count;
	int						count2;

	c = '0';
	lli = LLONG_MAX - 1;
	ulli = 987654321;
	count = printf(integer, c, lli, ulli);
	count2 = ft_printf(integer, c, lli, ulli);
	printCount("integer", count, count2);
	printVertivalSpace();
}
void	ft_test_unsigned_decima(void)
{
	char					c;
	long long int			lli;
	unsigned long long int	ulli;
	int						count;
	int						count2;

	c = '0';
	lli = LLONG_MAX - 1;
	ulli = 987654321;
	count = printf(unsigned_decima, c, lli, ulli);
	count2 = ft_printf(unsigned_decima, c, lli, ulli);
	printCount("unsigned_decima", count, count2);
	printVertivalSpace();
}
void	ft_test_hexadecimal_lowercase(void)
{
	char					c;
	long long int			lli;
	unsigned long long int	ulli;
	int						count;
	int						count2;

	c = '0';
	lli = LLONG_MAX - 1;
	ulli = 987654321;
	count = printf(hexadecimal_lowercase, c, lli, ulli);
	count2 = ft_printf(hexadecimal_lowercase, c, lli, ulli);
	printCount("hexadecimal_lowercase", count, count2);
	printVertivalSpace();
}
void	ft_test_hexadecimal_uppercase(void)
{
	char					c;
	long long int			lli;
	unsigned long long int	ulli;
	int						count;
	int						count2;

	c = '0';
	lli = LLONG_MAX - 1;
	ulli = 987654321;
	count = printf(hexadecimal_uppercase, c, lli, ulli);
	count2 = ft_printf(hexadecimal_uppercase, c, lli, ulli);
	printCount("hexadecimal_uppercase", count, count2);
	printVertivalSpace();
}
int	main(void)
{
	// ft_test_single_character();
	// ft_test_single_string();
	// ft_test_single_pointer();
	// ft_test_decimal();
	// ft_test_integer();
	// ft_test_unsigned_decima();
	// ft_test_hexadecimal_lowercase();
	// ft_test_hexadecimal_uppercase();
    ft_printf("mandeeeee 4120313121 gr ge gerg gerger  2");
	printOk("je suis OK");
	return (0);
}
