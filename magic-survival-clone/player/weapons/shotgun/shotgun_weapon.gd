class_name ShotgunWeapon
extends Weapon

var spread_radius:float = 35.0

func perform_shoot(dir:Vector2, shooter:Node2D):
	var start_of_radius:float = deg_to_rad(dir.rotated(spread_radius / 2))
	var spread_step:float = deg_to_rad(spread_radius) / pellet_number
	dir.rotated(start_of_radius)
	
	
	for i in range(pellet_number):
		var bullet = weapon_scene.instantiate()
		bullet.dir.rotated(i * spread_step)
