class_name ShotgunWeapon
extends Weapon

@export var spread_radius:float = 20
@export var proj_speed:float = 400
@export var pellet_number:int = 3

func perform_shoot(dir:Vector2, shooter:Node2D):
	var half_spread = deg_to_rad(spread_radius/2)
	var spread_step:float = deg_to_rad(spread_radius) / (pellet_number - 1)
	
	for i in range(pellet_number):
		var bullet = weapon_scene.instantiate()
		
		bullet.dir = dir.rotated((spread_step * i) -  half_spread)
		bullet.speed = proj_speed
		bullet.damage = damage
		bullet.texture = texture
		
		shooter.get_parent().add_child(bullet)
		bullet.global_position = shooter.global_position
