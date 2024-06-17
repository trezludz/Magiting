extends Button


func _on_Close_pressed():
	$"../RichTextLabel".hide()
	$".".hide()
	$"../Joystick".show()
