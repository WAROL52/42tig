#include "main.h"


void	fd_printfile(char *path);
void	ft_fdtest_multiple(void);
void	ft_printline(int num, int fd);
int	main(void)
{
	fd_printfile("others/texte.txt");
	// fd_printfile("others/texte2.txt");
	// ft_fdtest_multiple();
	return (0);
}
void	fd_printfile(char *path)
{
	int fd;
	char *str_oneline;
	int index;

	printf("\n\n");
	printf("paths=%s\n", path);
	printf("BUFFER_SIZEs=%d\n", BUFFER_SIZE);
	fd = open(path, O_RDONLY);
	printf("fd:%d\n", fd);
	index = 1;
	while (1)
	{
		// printf("_____________________\n");
		str_oneline = get_next_line(fd);
		printf("[%d]:%s", index, str_oneline);
		if (str_oneline)
		{
			// printf("free(p:%p)\n", str_oneline);
			free(str_oneline);
		}
		else
			break ;
		index++;
		// if (index == 10)
		// 	break ;5000000000
	}
}
void	ft_printline(int num, int fd)
{
	char *str_oneline;

	printf("\n\n");
	printf("BUFFER_SIZEs=%d\n", BUFFER_SIZE);

	printf("fd:%d\n", 1);
	str_oneline = get_next_line(fd);
	printf("[%d]:%s$", num, str_oneline);
	if (str_oneline)
		free(str_oneline);
}

void	ft_fdtest_multiple(void)
{
	printf("path=%s\n", "others/texte.txt");
	int fd1 = open("others/texte.txt", O_RDONLY);
	(void)fd1;
	printf("path=%s\n", "others/texte2.txt");
	int fd2 = open("others/texte2.txt", O_RDONLY);
	(void)fd2;
	// [1]---------------------------------
	ft_printline(1, fd1);
	ft_printline(1, 1005);
	// // [2]---------------------------------
	// ft_printline(2, fd1);
	// ft_printline(2, fd2);
	// // [2]---------------------------------
	// ft_printline(3, fd1);
	// ft_printline(3, fd2);
}