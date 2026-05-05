extends CharacterBody2D
class_name Enemy

enum State {MOVE, ATTACK, FLEE}
var current_state = State.MOVE

@export var stats:EnemyStats
var current_hp:float

var is_attacking:bool
var dir:Vector2

func _ready() -> void:
	$animation.sprite_frames = stats.texture
	$animation.play("default")
	
	current_hp = stats.hp

func _physics_process(_delta: float) -> void:	
	velocity = dir * stats.speed
	move_and_slide()

func take_damage(amount:float):
	current_hp -= amount
	if current_hp <= 0:
		Global.enemy_died()
		queue_free()

func manage_facing_direction():
	if dir.x > 0:
		$animation.flip_h = true
	else:
		$animation.flip_h = false

func state_handling():
	match current_state:
		State.MOVE:
			dir = (Global.Player.global_position - global_position).normalized()
			manage_facing_direction()
			
			if Global.Player.is_dead:
				current_state = State.FLEE
			if is_attacking:
				current_state = State.ATTACK
		State.ATTACK:
			velocity = Vector2.ZERO
			attack()
			
			if Global.Player.is_dead:
				current_state = State.FLEE
			if !is_attacking :
				current_state = State.MOVE
		State.FLEE:
			dir = -dir

func attack():
	Global.Player.take_damage(stats.damage)
