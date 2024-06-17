extends Control

var hearts = 5 setget set_hearts
var max_hearts = 5 setget set_max_hearts
var puzzle_pieces = 0 setget set_pieces

onready var heartUIFull = $HeartUIFull
onready var heartUIEmpty = $HeartUIEmpty
onready var puzzle_counter = $PuzzlePieceCounter
onready var player_stats = PlayerStats
onready var world_stats = WorldStats

func set_hearts(value):
	hearts = clamp(value,0,max_hearts)
	if heartUIFull != null:
		heartUIFull.rect_size.x = hearts * 16

func set_max_hearts(value):
	max_hearts = max(value, 1)
	if heartUIEmpty != null:
		heartUIEmpty.rect_size.x = max_hearts * 16

func set_pieces(value):
	puzzle_pieces = clamp(value,0,9)
	if puzzle_counter != null:
		puzzle_counter.text = "x" + str(puzzle_pieces) + "/9"

func _on_Max_Pieces():
	$Button.show()

func _ready():
	$Button.hide()
	$PauseMenu.hide()
	$Inspect.hide()
	$RichTextLabel.hide()
	$Close.hide()
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	self.puzzle_pieces = PlayerStats.collected_pieces
	PlayerStats.connect("health_changed", self, "set_hearts")
	PlayerStats.connect("puzzle_count_changed", self, "set_pieces")
	PlayerStats.connect("max_pieces", self, "_on_Max_Pieces")
	
func _process(delta):
	if world_stats.curr_level != "level 1/World":
		$HintCounter.text = "Hints: " + str(world_stats.hints)
