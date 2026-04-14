extends Area2D

@export var damage:int = 5
var dir:Vector2
var shooter:Node2D  #il player

func _ready() -> void:
	rotation = dir.angle()

func _process(delta: float) -> void:
	global_position = shooter.global_position

func _on_body_entered(body: Enemy) -> void:
	if body.is_in_group("enemy"):
		body.take_damage(damage)

func _on_lingeringtime_timeout() -> void:
	queue_free()
