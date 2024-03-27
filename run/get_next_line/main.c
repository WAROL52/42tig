/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrabetsy <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/15 11:19:42 by rrabetsy          #+#    #+#             */
/*   Updated: 2024/03/20 15:46:01 by rrabetsy         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

int main()
{
    int fd;
    char *buf;
    size_t count;

    count =5;

    buf = (char *)malloc(sizeof(char)*count);
    printf("salut WRO   dfgL\n");
    fd = open("out/texte.txt",O_RDONLY);

    read(fd,buf,count);
    get_next_line(1);
    printf("fd:%d , %s\n",fd,buf);
    read(fd,buf,count);
    printf("fd:%d , %s\n",fd,buf);
    return 0;
}
