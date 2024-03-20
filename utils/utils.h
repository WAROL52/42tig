/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrabetsy <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/20 13:06:30 by rrabetsy          #+#    #+#             */
/*   Updated: 2024/03/20 13:09:52 by rrabetsy         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef UTILS_H

#include <ctype.h>
#include <limits.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifndef t_size
typedef unsigned long	t_size;
#endif
void		ft_memset_test(void);
void		expectIntMap(char *name, int (*ft_value)(int), int (*ft_toBe)(int),
				int valueMax);
void		expectStringMap(char *name, t_size (*ft_value)(const char *__s),
				t_size (*ft_toBe)(const char *__s), char **strings, int size);

char		*createString(char *string);
char		**createStrings(t_size size, ...);
void		printOk(char *msg);
void		printError(char *msg);
void		printLine(void);
void		ft_bzero_test(void);
void		ft_memcpy_test(void);
void		ft_array_foreach(t_size size, void (*callback)(t_size));
int			ft_array_isequal(void *arr1, void *arr2, t_size size);
void		ft_memmove_test(void);

typedef int	(*t_ftcmp)(void *, t_size);
typedef int	(*t_callback)(const void *, t_size, t_size);
void		ft_test_map(char *name, void *list, t_size size, t_callback call1,
				t_callback call2);
void		ft_isalpha_test(void);
void		ft_putstrings(char **strings);
#endif