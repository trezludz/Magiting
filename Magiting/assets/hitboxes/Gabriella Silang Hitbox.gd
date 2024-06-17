extends StaticBody2D

onready var world_stats = WorldStats

func _draw():
	$Label.hide()

func _on_Gabriella_Silang_Hitbox_area_entered(area):
	$Label.show()


func _on_Gabriella_Silang_Hitbox_area_exited(area):
	$Label.hide()
