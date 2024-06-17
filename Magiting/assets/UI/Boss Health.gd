extends Control


var max_hearts = 3 setget set_max_hearts
onready var heartUIFull = $HeartUIFull
onready var heartUIEmpty = $HeartUIEmpty
onready var boss_stats = BossStats
var hearts = BossStats.health setget set_hearts

func set_max_hearts(value):
	max_hearts = max(value, 1)
	if heartUIEmpty != null:
		heartUIEmpty.rect_size.x = max_hearts * 16

func set_hearts(value):
	hearts = clamp(value,0,max_hearts)
	if heartUIFull != null:
		heartUIFull.rect_size.x = hearts * 16

func _ready():
	self.max_hearts = BossStats.max_health
	self.hearts = BossStats.health
	BossStats.connect("boss_health_changed", self, "set_hearts")

