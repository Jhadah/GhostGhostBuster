extends CharacterBody2D
class_name Enemy

@export var stats:EnemyStats
@onready var current_hp:float = stats.hp

var dir:Vector2

func _ready() -> void:
	$animation.sprite_frames = stats.texture
	$animation.play("default")

func _physics_process(_delta: float) -> void:
	dir = (Global.Player.global_position - global_position).normalized()
	velocity = dir * stats.speed
	move_and_slide()

func take_damage(amount:float):
	current_hp -= amount
	if current_hp <= 0:
		Global.enemy_died()
		queue_free()
	
