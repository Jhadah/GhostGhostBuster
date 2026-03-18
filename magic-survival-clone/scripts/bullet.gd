extends CharacterBody2D

@export var speed:int = 200
var dir:Vector2

func _ready() -> void:
	$AnimatedSprite2D.play("default")
	var angle = dir.angle()
	rotate(angle)

func _process(_delta: float) -> void:
	velocity = dir * speed
	if dir.x < 0:
		$AnimatedSprite2D.flip_h = true
	move_and_slide()
