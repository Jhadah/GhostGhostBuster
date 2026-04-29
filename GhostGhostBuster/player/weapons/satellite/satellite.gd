extends Area2D

var center:Node2D
var rot = 0
var rot_spd
var dist

func _ready() -> void:
	Upgrades.upgrade_acquired.connect(_on_upgrade_acquired)
	
	center = Global.Player

func _process(delta: float) -> void:
	rot += rot_spd * delta
	if rot >= TAU:
		rot = 0
	global_position = center.global_position +  Vector2.from_angle(rot).normalized() * dist

func _on_upgrade_acquired():
	queue_free()
