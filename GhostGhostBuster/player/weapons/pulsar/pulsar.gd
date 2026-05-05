extends Area2D

var damage:float
var speed:float
var dir:Vector2
var texture:SpriteFrames

var max_distance:int = 50
var scale_ratio:float = 0.005

var distance_traveled:float = 0
var starting_position:Vector2

func _ready() -> void:
	global_position= Global.Player.global_position
	starting_position = position
	
	$animation.sprite_frames = texture
	$animation.play("default")
	rotation = dir.angle()

func _physics_process(delta: float) -> void:
	position += speed * dir * delta
	
	distance_traveled = position.distance_to(starting_position)
	scale.y += distance_traveled * scale_ratio
	
	if distance_traveled > max_distance:
		queue_free()
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.take_damage(damage)
