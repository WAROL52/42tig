#include "main.h"

void fd_printfile(char *path);
int	main(void)
{
	fd_printfile("others/texte.txt");
	// fd_printfile("others/texte2.txt");
	return (0);
}
void fd_printfile(char *path)
{
	int fd;
	char *str_oneline;
	int index;

	printf("\n\n");
	printf("path=%s\n",path);
	printf("BUFFER_SIZE=%d\n",BUFFER_SIZE);
	fd = open(path, O_RDONLY);
	printf("fd:%d\n",fd);
	str_oneline=get_next_line(fd);
	index=1;
	while(str_oneline)
	{
		printf("[%d]:%s",index,str_oneline);
		if(str_oneline)
		{
			free(str_oneline);
		}
		str_oneline = get_next_line(fd);
		index++;
	}
	// if(str_oneline)
	// 	free(str_oneline);
}
