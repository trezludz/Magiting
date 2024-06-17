extends Control

onready var world_stats = WorldStats
onready var player_stats = PlayerStats
onready var boss_stats = BossStats

func _on_RetryButton_pressed():
	player_stats.health = 5
	player_stats.collected_pieces = 0
	get_tree().change_scene("res://src/"+world_stats.curr_level+".tscn")


func _on_Return_pressed():
	player_stats.health = 5
	world_stats.hints = 3
	boss_stats.health = 3
	player_stats.collected_pieces = 0
	get_tree().change_scene("res://src/World/TitleScreen.tscn")
