extends Node

onready var sliding_puzzle_scene = $"Sliding Puzzle"
onready var level = WorldStats

func _ready():
	sliding_puzzle_scene.hide()
	level.curr_level = "level 1/World"
