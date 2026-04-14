extends CharacterBody2D
class_name Enemy

var hp:float
@export var speed:int
var turn_speed:float = 2.0
var dir:Vector2
var current_dir:Vector2

func _ready() -> void:
	Global.enemy_spawned()

func _physics_process(delta: float) -> void:
	dir = (Global.Player.global_position - global_position).normalized()
	current_dir = current_dir.lerp(dir,turn_speed*delta)
	if dir.x > 0:
		$animation.flip_h = true
	else:
		$animation.flip_h = false
		
	velocity = current_dir * speed
	move_and_slide()

func take_damage(amount:float):
	hp -= amount
	if hp <= 0:
		die()

func die():
	Global.enemy_died()
	queue_free()
