extends Node

@onready var player:CharacterBody2D = get_parent()

@export var default_weapon:Weapon
@export var laser_weapon:Weapon
var equipped_weapons:Array[Weapon] = []

@onready var shoot_direction:Vector2
var is_targeting:bool = false



func _ready() -> void:
	equipped_weapons = [default_weapon, laser_weapon]

func _process(_delta: float) -> void:
	for weapon in equipped_weapons:
		if weapon.is_on_cooldown:
			continue
		if is_targeting:
			shoot(weapon)

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
