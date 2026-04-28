extends Area2D

var center:Node2D
var rot = 0
var rot_spd = 5
var dist = 30

func _ready() -> void:
	center = Global.Player

func _process(delta: float) -> void:
	rot += rot_spd * delta
	global_position = center.global_position +  Vector2.from_angle(rot).normalized() * dist
