extends Node

@onready var player:CharacterBody2D = get_parent()
@onready var shoot_direction:Vector2

@export var default_weapon:Weapon
@export var laser_weapon:Weapon

var equipped_weapons:Array[Weapon] = []
var is_targeting:bool = false

func _ready() -> void:
	Global.level_increased.connect(_on_level_up)
	Upgrades.upgrade_acquired.connect(on_upgrade_acquired)
	equipped_weapons = [default_weapon]

func _process(delta: float) -> void:
	for weapon in equipped_weapons:
		weapon.timer_update(delta)
		if weapon.can_shoot() and is_targeting:
			weapon.shoot(shoot_direction, player)

func shoot(weapon:Weapon):
	weapon.shoot(shoot_direction, player)
	weapon.is_on_cooldown = true
	await get_tree().create_timer(weapon.shoot_timer).timeout
	weapon.is_on_cooldown = false

func update_target(nearest_enemy:Node2D):
	if nearest_enemy == null:
		is_targeting = false
		return
	
	shoot_direction = (nearest_enemy.global_position - player.global_position).normalized()
	is_targeting = true

func _on_level_up():
	pass

func equip_weapon(weapon_to_add:Weapon):
	equipped_weapons.append(weapon_to_add)
	
func on_upgrade_acquired(upgrade:Dictionary):
		var weapon:Weapon = get(upgrade.weapon)
		var stat = upgrade.stat_to_upgrade
		var current_value = weapon.get(stat)
		var new_value = current_value + upgrade.add_amount
		weapon.set(stat, new_value)
