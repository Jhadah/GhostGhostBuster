class_name Weapon
extends Resource

@export var weapon_scene:PackedScene

@export var damage:float
@export var cooldown:float
@export var cooldown_min = 0.5 

var cooldown_timer = 0

func timer_update(delta:float):
	if cooldown_timer > 0:
		cooldown_timer -= delta

func can_shoot():
	return cooldown_timer <= 0

func shoot(dir:Vector2, shooter:Node2D):
	cooldown_timer = cooldown
	perform_shoot(dir, shooter)

func perform_shoot(_dir:Vector2, _shooter:Node2D):
	pass
