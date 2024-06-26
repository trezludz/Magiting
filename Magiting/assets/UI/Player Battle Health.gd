extends Control


var max_hearts = 5 setget set_max_hearts
onready var heartUIFull = $HeartUIFull
onready var heartUIEmpty = $HeartUIEmpty
onready var player_stats = PlayerStats
var hearts = PlayerStats.health setget set_hearts

func set_max_hearts(value):
	max_hearts = max(value, 1)
	if heartUIEmpty != null:
		heartUIEmpty.rect_size.x = max_hearts * 16

func set_hearts(value):
	hearts = clamp(value,0,max_hearts)
	if heartUIFull != null:
		heartUIFull.rect_size.x = hearts * 16

func _ready():
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	PlayerStats.connect("health_changed", self, "set_hearts")

