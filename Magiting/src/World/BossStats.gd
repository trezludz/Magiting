extends Node

export var max_health = 3
onready var health = max_health setget set_health

signal no_health
signal boss_health_changed(value)

func set_health(value):
	health = value
	emit_signal("boss_health_changed", health)
		
