import random
import sys
# Taille du labyrinthe sans la bordure
INNER_WIDTH = int(sys.argv[1])
INNER_HEIGHT = int(sys.argv[2])

# Directions pour les mouvements : (dx, dy)
DIRECTIONS = [(-1, 0), (1, 0), (0, -1), (0, 1)]

def create_empty_maze(width, height):
    # Crée une grille avec des murs (1) autour
    maze = [[1 for _ in range(width + 2)] for _ in range(height + 2)]
    for y in range(1, height + 1):
        for x in range(1, width + 1):
            maze[y][x] = 1
    return maze

def is_valid_move(maze, x, y):
    return 1 <= x < INNER_WIDTH + 1 and 1 <= y < INNER_HEIGHT + 1 and maze[y][x] == 1

def carve_passages(maze, x, y):
    maze[y][x] = 0
    random.shuffle(DIRECTIONS)
    for dx, dy in DIRECTIONS:
        nx, ny = x + dx * 2, y + dy * 2
        if is_valid_move(maze, nx, ny):
            maze[y + dy][x + dx] = 0
            carve_passages(maze, nx, ny)

def print_maze(maze):
    for row in maze:
        print(''.join(str(cell) for cell in row))
    for row in maze:
        print(' '.join(str(cell) for cell in row).replace("0"," ").replace("1","\033[32m#\033[0m"))

def generate_maze(width, height):
    maze = create_empty_maze(width, height)
    start_x, start_y = (1, 1)
    carve_passages(maze, start_x, start_y)
    maze[1][1] = 0  # Entrée
    maze[height][width] = 0  # Sortie
    return maze

# Générer et afficher le labyrinthe
maze = generate_maze(INNER_WIDTH, INNER_HEIGHT)
print_maze(maze)
