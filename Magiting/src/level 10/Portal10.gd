extends StaticBody2D

onready var world_stats = WorldStats
onready var player_stats = PlayerStats
onready var boss_stats = BossStats

var chapter_select: Dictionary = read_json_file_chapter_select("user://chapter_select.json")


func read_json_file_chapter_select(filename):
	var file = File.new()
	file.open(filename, file.READ)
	var text = file.get_as_text()
	var json_data = parse_json(text)
	file.close()
	return json_data

func write_json_file_chapter_select(filename):
	var file = File.new()
	file.open(filename, file.WRITE)
	chapter_select["Level 10"] = true
	file.store_string(JSON.print(chapter_select))
	file.close()
	


func _process(delta):
	if world_stats.puzzle_solved and world_stats.boss_defeated and get_parent().get_parent().enemy_counter == 0:
		$PortalSprite/Area2D/CollisionShape2D.set_deferred("disabled", false)
	else:
		$PortalSprite/Area2D/CollisionShape2D.set_deferred("disabled", true)

func _on_Area2D_area_entered(area):
	write_json_file_chapter_select("user://chapter_select.json")
	world_stats.hints = 3
	player_stats.health = 5
	boss_stats.health = 3
	player_stats.collected_pieces = 0
	get_tree().change_scene("res://src/World/CongratulationsScreen.tscn")
