extends Button

onready var main_scene = $"../../.."
onready var UI = $"../.."
onready var puzzle_cam = $"../../../../Sliding Puzzle 4/PuzzleCam"
onready var player_cam = $"../../../Player/PlayerCam"
onready var joystick = $"../Joystick"
onready var knob = $"../Joystick/Knob"
var puzzle_screen = preload("res://src/level 4/SlidingPuzzle4.tscn")
onready var puzzle_scene

onready var worldStats = WorldStats

func _on_Button_pressed():
	puzzle_scene = puzzle_screen.instance()
	get_node("../../../..").add_child(puzzle_scene)
	puzzle_cam.make_current()
	main_scene.hide()
	joystick.set_process(false)
	knob.position = worldStats.knob_position
	UI.hide()
	puzzle_scene.show()
