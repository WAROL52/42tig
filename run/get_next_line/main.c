#include "main.h"



int	main(void)
{
	int fd = open("others/texte.txt", O_RDONLY);
	printf("%s",get_next_line(fd));
	return (0);
}
