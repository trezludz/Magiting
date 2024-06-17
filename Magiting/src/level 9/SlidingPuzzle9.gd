extends Node2D

onready var world_stats = WorldStats
onready var world_scene = $"../Level9"
onready var UI = $"../Level9/CanvasLayer"
onready var player_cam = $"../Level9/Player/PlayerCam"
onready var solve_button = $"../Level9/CanvasLayer/Player UI/Button"

func _on_PuzzleButton_pressed():
	world_stats.puzzle_solved = true
	world_scene.show()
	UI.show()
	player_cam.make_current()
	solve_button.hide()
	queue_free()
