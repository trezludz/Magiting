extends StaticBody2D

onready var player_stats = PlayerStats

func _on_puzzleHitBox_area_entered(area):
	player_stats.collected_pieces += 1
	$".".queue_free()
