extends Sprite

onready var battle_scene = $"../../../../Battle Scene Level 5"
onready var main_scene = $"../../.."
onready var UI = $"../.."
onready var battle_cam =$"../../../../Battle Scene Level 5/BattleCam"
onready var player_cam = $"../../../Player/PlayerCam"
onready var joystick = $"../Joystick"
onready var knob = $"../Joystick/Knob"
var battle_screen = preload("res://src/level 5/Battle Scene Level 5.tscn")
onready var worldStats = WorldStats

func _on_Fight_pressed():
	battle_scene = battle_screen.instance()
	get_node("../../../..").add_child(battle_scene)
	battle_cam.make_current()
	main_scene.hide()
	UI.hide()
	battle_scene.show()
	$".".hide()


func _on_Run_pressed():
	$".".hide()
	joystick.show()
