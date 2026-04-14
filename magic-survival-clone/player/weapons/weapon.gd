extends Resource
class_name Weapon

@export var weapon_scene:PackedScene
@export var speed:int
@export var shoot_timer:float

var is_on_cooldown:bool = false

func shoot(_dir:Vector2, _shooter:Node2D):
	pass
