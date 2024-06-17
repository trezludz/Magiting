extends Button

var world_stats = WorldStats
func _on_Pause_pressed():
	$"../PauseMenu".show()
	$"../Joystick".hide()
