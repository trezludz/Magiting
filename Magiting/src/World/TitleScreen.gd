extends Control



func _ready():
	var file = File.new()
	if !file.file_exists("user://chapter_select.json"):
		file.open("user://chapter_select.json", file.WRITE)
		var json_init = {"Level 1": true, "Level 2": true, "Level 3": true, "Level 4": true, "Level 5": true, "Level 6": true, "Level 7": true, "Level 8": true, "Level 9": true, "Level 10": true}
		file.store_string(JSON.print(json_init))
		file.close()
		
func _on_StartButton_pressed():
	get_tree().change_scene("res://src/level 1/World.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()

func _on_LevelSelect_pressed():
	get_tree().change_scene("res://src/World/LevelSelect.tscn")

func _on_HelpButton_pressed():
	get_tree().change_scene("res://src/World/HelpScreen.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://src/World/Credits.tscn")
