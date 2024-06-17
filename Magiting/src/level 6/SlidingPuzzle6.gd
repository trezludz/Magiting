extends Node2D

onready var world_stats = WorldStats
onready var world_scene = $"../Level6"
onready var UI = $"../Level6/CanvasLayer"
onready var player_cam = $"../Level6/Player/PlayerCam"
onready var solve_button = $"../Level6/CanvasLayer/Player UI/Button"

func _on_PuzzleButton_pressed():
	world_stats.puzzle_solved = true
	world_scene.show()
	UI.show()
	player_cam.make_current()
	solve_button.hide()
	queue_free()
