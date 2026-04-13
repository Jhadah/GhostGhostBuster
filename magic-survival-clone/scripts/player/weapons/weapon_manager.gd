extends Node

@export var default_weapon:Weapon
@export var laser_weapon:Weapon

@onready var current_weapon:Weapon = laser_weapon

func shoot(dir:Vector2, shooter:Node2D):
	current_weapon.shoot(dir, shooter)
