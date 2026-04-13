extends Node

@export var default_weapon:Weapon

@onready var current_weapon:Weapon = default_weapon

func shoot(dir:Vector2, shooter:Node2D):
	var bullet = current_weapon.weapon_scene.instantiate()
	bullet.dir = dir
	bullet.position = shooter.global_position
	
	shooter.get_parent().add_child(bullet)
