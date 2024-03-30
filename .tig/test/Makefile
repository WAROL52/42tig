test\:libft:
	@find libft/Makefile
	@norminette $(wildcard libft/*.c) || echo "norminette: KO"
	@find libft/libftTester/Makefile || git clone git@github.com:Tripouille/libftTester.git libft/libftTester
	@cd libft/libftTester && make

test\:printf:
	@find $(REPOS_DIR)/printf/Makefile
	@norminette $(wildcard $(REPOS_DIR)/printf/*.c) || echo "norminette: KO"
	@find $(REPOS_DIR)/printf/ft_printf_tester/Makefile || git clone https://github.com/paulo-santana/ft_printf_tester.git $(REPOS_DIR)/printf/ft_printf_tester
	@cd $(REPOS_DIR)/printf/ft_printf_tester && sh test m

test\:get_next_line:
	@find get_next_line/Makefile
	@norminette $(wildcard get_next_line/*.c) || echo "norminette: KO"
	@find get_next_line/gnlTester/Makefile || git clone https://github.com/Tripouille/gnlTester.git get_next_line/gnlTester
	@cd get_next_line/gnlTester && make
