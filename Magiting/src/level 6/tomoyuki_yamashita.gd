extends StaticBody2D

onready var boss_battle_scene = $"../../Boss Battle Scene Level 6"
onready var main_scene = $".."
onready var UI = $"../CanvasLayer"
onready var battle_cam = $"../../Battle Scene Level 6/BattleCam"
onready var player_cam = $"../Player/PlayerCam"
onready var joystick = $"../CanvasLayer/Player UI/Joystick"
onready var knob = $"../CanvasLayer/Player UI/Joystick/Knob"
var boss_battle_screen = preload("res://src/level 6/Boss Battle Scene Level 6.tscn")


onready var worldStats = WorldStats

func _on_Enemy_Hitbox_area_entered(area):
	boss_battle_scene = boss_battle_screen.instance()
	get_node("../..").add_child(boss_battle_scene)
	worldStats.enemy = $"."
	battle_cam.make_current()
	main_scene.hide()
	joystick.set_process(false)
	knob.position = worldStats.knob_position
	UI.hide()
	boss_battle_scene.show()


func _on_Battle_Scene_Level_2_win():
	player_cam.make_current()

