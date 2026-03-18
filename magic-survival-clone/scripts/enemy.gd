extends CharacterBody2D

#--stats--
@export var speed: int = 100
@export var turn_speed:float = 2.0

var dir:Vector2
var current_dir:Vector2

func _ready() -> void:
	Global.enemy_spawned()
	$AnimatedSprite2D.play("default")

func _physics_process(delta: float) -> void:
	dir = (Global.player.global_position - global_position).normalized()
	current_dir = current_dir.lerp(dir,turn_speed*delta)
	velocity = current_dir * speed
	move_and_slide()

func die():
	Global.enemy_died()
	queue_free()
	
