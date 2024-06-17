extends StaticBody2D

onready var world_stats = WorldStats

func _draw():
	$Label.hide()

func _on_Bonifacio_Hitbox_area_entered(area):
	$Label.show() # Replace with function body.

func _on_Bonifacio_Hitbox_area_exited(area):
	$Label.hide() # Replace with function body.
