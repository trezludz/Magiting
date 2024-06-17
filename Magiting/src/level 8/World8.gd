extends Node

onready var world_stats = WorldStats
var question_sets: Array = read_json_file_battle("res://assets/json/level8.json")
var hangman_sets: Array = read_json_file_boss("res://assets/json/level8_boss.json")
var question_counter = 0
var hangman_counter = 0
var enemy_counter = 10

func _ready():
	world_stats.curr_level = "level 8/World8"
	world_stats.puzzle_solved = false
	world_stats.boss_defeated = false
	$"Level8/CanvasLayer/Player UI/Engage Enemy window".hide()
func read_json_file_battle(filename):
	var file = File.new()
	file.open(filename, file.READ)
	var text = file.get_as_text()
	var json_data = parse_json(text)
	file.close()
	return json_data

func read_json_file_boss(filename):
	var file = File.new()
	file.open(filename, file.READ)
	var text = file.get_as_text()
	var json_data = parse_json(text)
	file.close()
	return json_data
