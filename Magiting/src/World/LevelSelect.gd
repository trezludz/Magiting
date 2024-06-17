extends Control


var chapter_select: Dictionary = read_json_file_chapter_select("user://chapter_select.json")
onready var levels = [$"Level 1", $"Level 2", $"Level 3", $"Level 4", $"Level 5", $"Level 6", $"Level 7", $"Level 8", $"Level 9", $"Level 10"]
func _ready():
	for i in range (0, chapter_select.size()):
		if chapter_select[levels[i].text] == false:
			levels[i].disabled = true
		else:
			levels[i].disabled = false
		print(levels[i])
	
func read_json_file_chapter_select(filename):
	var file = File.new()
	file.open(filename, file.READ)
	var text = file.get_as_text()
	var json_data = parse_json(text)
	file.close()
	return json_data

func _on_Back_pressed():
	get_tree().change_scene("res://src/World/TitleScreen.tscn")

func _on_Level_1_pressed():
	get_tree().change_scene("res://src/level 1/World.tscn")

func _on_Level_2_pressed():
	get_tree().change_scene("res://src/level 2/World2.tscn")

func _on_Level_3_pressed():
	get_tree().change_scene("res://src/level 3/World3.tscn")

func _on_Level_4_pressed():
	get_tree().change_scene("res://src/level 4/World4.tscn")

func _on_Level_5_pressed():
	get_tree().change_scene("res://src/level 5/World5.tscn")

func _on_Level_6_pressed():
	get_tree().change_scene("res://src/level 6/World6.tscn")

func _on_Level_7_pressed():
	get_tree().change_scene("res://src/level 7/World7.tscn")

func _on_Level_8_pressed():
	get_tree().change_scene("res://src/level 8/World8.tscn")

func _on_Level_9_pressed():
	get_tree().change_scene("res://src/level 9/World9.tscn")

func _on_Level_10_pressed():
	get_tree().change_scene("res://src/level 10/World10.tscn")






