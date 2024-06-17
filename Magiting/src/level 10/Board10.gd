extends Area2D

var tiles = []
var solved = []
var touch = false
var win = false
var click_counter = 0
onready var player_stats = PlayerStats

# Called when the node enters the scene tree for the first time.
func _ready():
	$"../../Details".text = "Solve the puzzle and all will be revealed"
	$"../../PuzzleButton".hide()
	$"../../AutoComplete".hide()
	start_game()

func start_game():
	tiles = [$Puzzle, $Puzzle2, $Puzzle3, $Puzzle4, $Puzzle5, $Puzzle6, $Puzzle7, $Puzzle8, $Puzzle9]
	solved = tiles.duplicate()
	shuffle_tiles()
	
func shuffle_tiles():
	var previous = 99
	var previous_1 = 98
	for t in range(0,1000):
		randomize()
		var tile = randi() % 9
		if tiles[tile] != $Puzzle9 and tile != previous and tile != previous_1:
			var rows = int(tiles[tile].position.y / 60)
			var cols = int(tiles[tile].position.x / 60)
			check_neighbours(rows,cols)
			previous_1 = previous
			previous = tile
			
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if touch and !win:
		if touch.position.x >= 0 and touch.position.x <= 180 and touch.position.y >=0 and touch.position.y <= 180:
			var touch_copy = touch
			click_counter += 1
			print(click_counter)
			if click_counter == 100:
				$"../../AutoComplete".show()
			touch = false
			var rows = int(touch_copy.position.y / 60)
			var cols = int(touch_copy.position.x / 60)
			check_neighbours(rows,cols)
			
			if tiles == solved:
				win = true
				$"../../Details".text = "Privatization was a major issue during the Ramos Administration. Numerous companies previously owned by the Philippine Government were sold to businessmen, changing its ownership from public to private. Among these companies was Petron."
				$"../../PuzzleButton".show()
				$"../../AutoComplete".hide()

func check_neighbours(rows, cols):
	var empty = false
	var done = false
	var pos = rows * 3 + cols
	while !empty and !done:
		var new_pos = tiles[pos].position
		if rows < 2:
			new_pos.y += 60
			empty = find_empty(new_pos,pos)
			new_pos.y -= 60
		if rows > 0:
			new_pos.y -= 60
			empty = find_empty(new_pos,pos)
			new_pos.y += 60
		if cols < 2:
			new_pos.x += 60
			empty = find_empty(new_pos,pos)
			new_pos.x -= 60
		if cols > 0:
			new_pos.x -= 60
			empty = find_empty(new_pos,pos)
			new_pos.x += 60
		done = true
			
func find_empty(position,pos):
	var new_rows = int(position.y / 60)
	var new_cols = int(position.x / 60)
	var new_pos = new_rows * 3 + new_cols
	if tiles[new_pos] == $Puzzle9:
		swap_tiles(pos, new_pos)
		return true
	else:
		return false

func swap_tiles(tile_src, tile_dst):
	var temp_pos = tiles[tile_src].position
	tiles[tile_src].position = tiles[tile_dst].position
	tiles[tile_dst].position = temp_pos
	var temp_tile = tiles[tile_src]
	tiles[tile_src] = tiles[tile_dst]
	tiles[tile_dst] = temp_tile
	
	
func _input(event):
	if event is InputEventScreenTouch:
		touch = event


func _on_AutoComplete_pressed():
	$"../../AutoComplete".hide()
	win = true
	$Puzzle.position.x = 0
	$Puzzle.position.y = 0
	$Puzzle2.position.x = 60
	$Puzzle2.position.y = 0
	$Puzzle3.position.x = 120
	$Puzzle3.position.y = 0
	$Puzzle4.position.x = 0
	$Puzzle4.position.y = 60
	$Puzzle5.position.x = 60
	$Puzzle5.position.y = 60
	$Puzzle6.position.x = 120
	$Puzzle6.position.y = 60
	$Puzzle7.position.x = 0
	$Puzzle7.position.y = 120
	$Puzzle8.position.x = 60
	$Puzzle8.position.y = 120
	$Puzzle9.position.x = 120
	$Puzzle9.position.y = 120
	$"../../Details".text = "Privatization was a major issue during the Ramos Administration. Numerous companies previously owned by the Philippine Government were sold to businessmen, changing its ownership from public to private. Among these companies was Petron."
	$"../../PuzzleButton".show()
	player_stats.health -=1
