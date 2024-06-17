extends Button

onready var joystick = $"../Joystick"
onready var knob = $"../Joystick/Knob"
onready var worldStats = WorldStats

func _on_Area2D_area_entered(area):
	$".".show()
	

func _on_Area2D_area_exited(area):
	$".".hide()


func _on_Inspect_pressed():
	joystick.set_process(false)
	knob.position = worldStats.knob_position
	joystick.hide()
	$"../RichTextLabel".show()
	$"../Close".show()
