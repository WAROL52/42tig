#include "main.h"


int	main(void)
{
	int fd;
	char *buf;
	size_t count;

	count = 50;

	buf = (char *)malloc(sizeof(char) * count);
	printf("salut WRO   dfgL\n");
	fd = open("out/texte.txt", O_RDONLY);

	read(fd, buf, count);
	get_next_line(1);
	printf("fd:%d , %s\n", fd, buf);
	return (0);
}
