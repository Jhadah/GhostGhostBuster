class_name Weapon
extends Resource

@export var weapon_scene:PackedScene

@export var base_damage:float
@export var base_speed:int
@export var base_count:int
@export var base_cooldown:float
@export var base_pellet_number:int
@export var cooldown_min = 0.5 

var damage:float = base_damage
var speed:float = base_speed
var count:int = base_count
var cooldown:float = base_cooldown
var pellet_number:int = base_pellet_number

var cooldown_timer = 0

var damage_upgrades = []
var speed_upgrades = []
var count_upgrades = []
var cooldown_upgrades = []

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

#region upgrade appying
func apply_upgrades():
	var bonus_damage = 0
	var bonus_haste = 0
	var bonus_speed = 0
	var bonus_count = 0
	
	bonus_damage = compute_upgrades(damage_upgrades, bonus_damage)
	damage = base_damage + bonus_damage
	
	bonus_speed = compute_upgrades(speed_upgrades, bonus_speed)
	speed = base_speed + bonus_speed
	
	bonus_count = compute_upgrades(count_upgrades, bonus_count)
	count = base_count + bonus_count

	bonus_haste = compute_upgrades(cooldown_upgrades, bonus_haste)
	cooldown = max(cooldown_min, base_cooldown / (1 + (bonus_haste/100)))
	
func compute_upgrades(upgrade_array:Array, bonus):
	for upgrade:float in upgrade_array:
		bonus += upgrade
	return bonus
#endregion
