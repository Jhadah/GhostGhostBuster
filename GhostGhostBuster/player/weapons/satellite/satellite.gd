extends Area2D

var center:Node2D
var rot = 0
var rot_spd
var dist

func _ready() -> void:
	Global.permanent_ability_upgraded.connect(_on_permanent_ability_upgrade)
	
	center = Global.Player

func _process(delta: float) -> void:
	rot += rot_spd * delta
	if rot >= TAU:
		rot = 0
	global_position = center.global_position +  Vector2.from_angle(rot).normalized() * dist

func _on_permanent_ability_upgrade():
	queue_free()
