extends CharacterBody2D

#--stats--
@export var speed: int = 100

var dir:Vector2

func _ready() -> void:
	$AnimatedSprite2D.play("default")

func _physics_process(_delta: float) -> void:
	dir = (Global.player.global_position - global_position).normalized()
	velocity = dir * speed
	move_and_slide()
