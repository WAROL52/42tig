/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   functest.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrabetsy <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/20 18:27:03 by rrabetsy          #+#    #+#             */
/*   Updated: 2024/03/20 13:06:53 by rrabetsy         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "utils.h"
#include <stdarg.h>

typedef union
{
	int		int_value;
	char	char_value;
	// and so on
}			any_t;

void		ft_foreach(int size, void (*callback)(int));
void		printOk(char *msg);
void		printError(char *msg);
void		printLine(void);
void	expectIntMap(char *name, int (*ft_value)(int), int (*ft_toBe)(int),
		int valueMax)
{
	int	testValue;
	int	isOk;
	int	value;
	int	toBe;

	testValue = valueMax;
	isOk = 1;
	while (testValue)
	{
		if (ft_value(testValue) != ft_toBe(testValue))
		{
			isOk = 0;
			break ;
		}
		testValue--;
	}
	if (isOk)
		printOk(name);
	else
	{
		printError(name);
		testValue = valueMax;
		while (testValue)
		{
			value = ft_value(testValue);
			toBe = ft_toBe(testValue);
			if (ft_value(testValue) != ft_toBe(testValue))
			{
				printf("[Test ascii %d:%c] %d==%d\n", testValue, testValue,
					value, toBe);
				isOk = 0;
			}
			testValue--;
		}
		printLine();
	}
}

void	expectStringMap(char *name, size_t (*ft_value)(const char *__s),
		size_t (*ft_toBe)(const char *__s), char **strings, int size)
{
	int		index;
	char	*string;
	size_t	value;
	size_t	toBe;
	int		isValid;

	isValid = 1;
	index = 0;
	while (index < size)
	{
		string = strings[index];
		value = ft_value(string);
		toBe = ft_toBe(string);
		if (value != toBe)
			isValid = 0;
		index++;
	}
	if (isValid)
	{
		printOk(name);
	}
	else
	{
		printLine();
		printError(name);
		void callback(t_size index)
		{
			string = strings[index];
			value = ft_value(string);
			toBe = ft_toBe(string);
			if (value != toBe)
			{
				printf("%zu-[input]: \"%s\"\n  [valeur-att]:%zu\n  [valeur-obt]:%zu\n\n",
					index, string, value, toBe);
			}
		};
		ft_array_foreach(size, callback);
		printLine();
	}
}
void	printOk(char *msg)
{
	printf("- %s: ok\n", msg);
}
void	printError(char *msg)
{
	printf("-Error: %s\n", msg);
}

void	printLine(void)
{
	printf("---------------------\n");
}
char	*createString(char *string)
{
	return (string);
}
char	**createStrings(size_t size, ...)
{
	char	**strings;
	va_list	parametersInfos;
	size_t	index;
	char	*string;

	index = 0;
	strings = (char **)malloc(size * sizeof(char *));
	(void)strings;
	va_start(parametersInfos, size);
	while (index < size)
	{
		string = (char *)va_arg(parametersInfos, char *);
		strings[index] = string;
		index++;
	}
	va_end(parametersInfos);
	return (strings);
}

void	ft_array_foreach(t_size size, void (*callback)(t_size))
{
	t_size	index;

	index = 0;
	while (index < size)
	{
		callback(index);
		index++;
	}
}

int	ft_array_isequal(void *arr1, void *arr2, t_size size)
{
	t_size	index;

	index = 0;
	while (index < size)
	{
		if (((char *)arr1)[index] != ((char *)arr2)[index])
		{
			printf("(%c===%c)\n", ((char *)arr1)[index], ((char *)arr2)[index]);
			return (0);
		}
		index++;
	}
	return (1);
}
void	ft_map(t_size size, void *(*ft_callback)(t_size))
{
	t_size	index;

	index = 0;
	while (index < size)
	{
		ft_callback(index);
		index++;
	}
}

void	ft_test_map(char *name, void *list, t_size size, t_callback call1,
		t_callback call2)
{
	t_size	index;
	int		value1;
	int		value2;

	index = 0;
	while (index < size)
	{
		value1 = call1(list, index, size);
		value2 = call2(list, index, size);
		if (value1 != value2)
		{
			printError(name);
		}
		index++;
	}
}

void	ft_putstrings(char **strings)
{
	t_size index = 0;
	if(!strings)
	{
		printf("NULL\n");
		return;
	}
	printf("[");
	while (strings[index] != NULL)
	{
		printf("\"");
		printf("%s",strings[index]);
		printf("\"");
		index++;
		printf(", ");
	}
	if(strings[index] == NULL)
		printf("NULL");
	printf("]\n");
}