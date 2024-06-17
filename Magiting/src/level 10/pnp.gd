extends StaticBody2D

onready var joystick = $"../CanvasLayer/Player UI/Joystick"
onready var knob = $"../CanvasLayer/Player UI/Joystick/Knob"
onready var worldStats = WorldStats

func _on_Enemy_Hitbox_area_entered(area):
	joystick.set_process(false)
	knob.position = worldStats.knob_position
	joystick.hide()
	$"../CanvasLayer/Player UI/Engage Enemy window".show()
	worldStats.enemy = $"."


