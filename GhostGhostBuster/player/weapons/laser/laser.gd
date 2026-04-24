extends Area2D

var dir:Vector2
var shooter:Node2D  #il player
var damage:float
var texture:SpriteFrames

func _ready() -> void:
	rotation = dir.angle()
	$beam.sprite_frames = texture
	$beam.play("default")
	

func _process(_delta: float) -> void:
	global_position = shooter.global_position

func _on_body_entered(body: Enemy) -> void:
	if body.is_in_group("enemy"):
		body.take_damage(damage)

func _on_lingeringtime_timeout() -> void:
	queue_free()
