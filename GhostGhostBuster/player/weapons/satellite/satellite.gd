extends Area2D

var center:Node2D
var rot:float = 0.0
var rot_spd:float
var dist:float
var damage:float
var texture:SpriteFrames

func _ready() -> void:
	Global.permanent_ability_upgraded.connect(_on_permanent_ability_upgrade)
	
	center = Global.Player
	$animation.sprite_frames = texture
	
func _process(delta: float) -> void:
	rot += rot_spd * delta
	if rot >= TAU:
		rot = 0
	global_position = center.global_position +  Vector2.from_angle(rot).normalized() * dist
	
	rotation = rot
	
func _on_permanent_ability_upgrade():
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.take_damage(damage)
