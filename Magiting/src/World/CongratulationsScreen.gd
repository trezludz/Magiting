extends Control




func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://src/World/TitleScreen.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()





