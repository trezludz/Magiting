extends Node2D

onready var world_stats = WorldStats
onready var world_scene = $"../Level3"
onready var UI = $"../Level3/CanvasLayer"
onready var player_cam = $"../Level3/Player/PlayerCam"
onready var solve_button = $"../Level3/CanvasLayer/Player UI/Button"
func _on_PuzzleButton_pressed():
	world_stats.puzzle_solved = true
	world_scene.show()
	UI.show()
	player_cam.make_current()
	solve_button.hide()
	queue_free()
