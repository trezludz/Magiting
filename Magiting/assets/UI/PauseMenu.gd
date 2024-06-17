extends Sprite

var world_stats = WorldStats
var player_stats = PlayerStats


func _on_MainMenu_pressed():
	world_stats.hints = 3
	player_stats.health = 5
	player_stats.collected_pieces = 0
	get_tree().change_scene("res://src/World/TitleScreen.tscn")

func _on_Resume_pressed():
	$".".hide()
	$"../Joystick".show()
