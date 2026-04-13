extends Weapon

func shoot(dir:Vector2, shooter:Node2D):
	var bullet = weapon_scene.instantiate()
	bullet.dir = dir
	bullet.position = shooter.global_position
	
	shooter.get_parent().add_child(bullet)
