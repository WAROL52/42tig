void ft_nbr_put(int nbr, char *base)
{
    int base_len;
    base_len=0;
    while (base[base_len])
        base_len++;
    if (nbr == -2147483648)
    {
        ft_nbr_put(-2147483648 / base_len,base);
        ft_nbr_put(2147483648 % base_len,base);
        return;
    }
    if (nbr < 0)
    {
        write(1,"-",1);
        nbr=-nbr;
    }
    if (nbr < base_len)
    {
        write(1,base + nbr,1);
        return;
    }
    ft_nbr_put(nbr / base_len,base);
    ft_nbr_put(nbr % base_len,base);
}
int main(int argc, char const *argv[])
{
    if (argc != 3)
    {
        printf("nbr_base <nbr> <base>\n");
        return (0);
    }
    ft_nbr_put(atoi(argv[1]),argv[2]);
    return 0;
}
