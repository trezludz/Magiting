extends Node2D

onready var world_stats = WorldStats
onready var world_scene = $"../Level10"
onready var UI = $"../Level10/CanvasLayer"
onready var player_cam = $"../Level10/Player/PlayerCam"
onready var solve_button = $"../Level10/CanvasLayer/Player UI/Button"

func _on_PuzzleButton_pressed():
	world_stats.puzzle_solved = true
	world_scene.show()
	UI.show()
	player_cam.make_current()
	solve_button.hide()
	queue_free()
