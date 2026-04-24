class_name DefaultWeapon
extends Weapon

@export var count:int = 1
@export var proj_speed:float = 400
@export var multiple_shots_delay:float = 0.1

func perform_shoot(dir:Vector2, shooter:Node2D):
	for i in range(count):
		var fireball = weapon_scene.instantiate()
		
		fireball.dir = dir
		fireball.speed = proj_speed
		fireball.damage = damage
		fireball.texture = texture
		
		shooter.get_parent().add_child(fireball)
		fireball.global_position = shooter.global_position
		
		await Global.custom_timer(multiple_shots_delay)
