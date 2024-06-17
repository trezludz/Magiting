extends Node

export var max_health = 1
export var puzzle_count = 0
onready var health = max_health setget set_health
onready var collected_pieces = puzzle_count setget set_puzzle_pieces

signal no_health
signal max_pieces
signal health_changed(value)
signal puzzle_count_changed(value)

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")
		
func set_puzzle_pieces(value):
	collected_pieces = value
	emit_signal("puzzle_count_changed", collected_pieces)
	if collected_pieces == 9:
		emit_signal("max_pieces")
