extends CharacterBody2D
class_name Enemy

@export var stats:EnemyStats

var dir:Vector2

func _ready() -> void:
	$animation.sprite_frames = stats.texture
	$animation.play("default")

func _physics_process(delta: float) -> void:
	dir = (Global.Player.global_position - global_position).normalized()
	velocity = dir * stats.speed
	move_and_slide()

func take_damage(amount:float):
	stats.hp -= amount
	if stats.hp <= 0:
		Global.enemy_died()
		queue_free()
	
