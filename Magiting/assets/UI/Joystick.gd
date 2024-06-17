extends TouchScreenButton

onready var knob = $Knob
onready var max_distance = shape.radius
onready var worldStats = WorldStats
var touch = false

var stick_center: Vector2 = normal.get_size() / 2
var touched: bool = false

func _ready():
	worldStats.knob_position = stick_center
	set_process(false)
	
	
func _input(event):
	if event is InputEventScreenTouch:
		touch = event
		if event.pressed:
			set_process(true)
		elif not event.pressed:
			set_process(false)
			knob.position = stick_center
		
			
func _process(delta):
	if touch:
		if touch.position.x >= 25.5 and touch.position.x <= 85.5 and touch.position.y >= 110 and touch.position.y <= 170:
			knob.global_position = get_global_mouse_position()
			knob.position = stick_center + (knob.position - stick_center).limit_length(max_distance)
	
func get_joystick_dir() -> Vector2:
	var dir = knob.position - stick_center
	return dir.normalized()


