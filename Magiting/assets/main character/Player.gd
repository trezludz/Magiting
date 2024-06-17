extends KinematicBody2D

export(int) var speed = 100.0

var stats = PlayerStats

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	var direction =$"../CanvasLayer/Player UI/Joystick".get_joystick_dir()
	input_vector = direction
	
	if input_vector == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		move_and_slide(input_vector * speed)
		$AnimationTree.set("parameters/Idle/blend_position", input_vector)
		$AnimationTree.set("parameters/Walk/blend_position", input_vector)

func _ready():
	stats.connect("no_health", self, "_on_Stats_no_health")

func _on_Stats_no_health():
	get_tree().change_scene("res://src/World/GameOverScreen.tscn")
