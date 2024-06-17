extends Node2D

onready var world_stats = WorldStats
onready var world_scene = $"../Level2"
onready var UI = $"../Level2/CanvasLayer"
onready var player_cam = $"../Level2/Player/PlayerCam"
onready var solve_button = $"../Level2/CanvasLayer/Player UI/Button"
func _on_PuzzleButton_pressed():
	world_stats.puzzle_solved = true
	world_scene.show()
	UI.show()
	player_cam.make_current()
	solve_button.hide()
	queue_free()
