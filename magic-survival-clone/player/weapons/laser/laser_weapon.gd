class_name LaserWeapon
extends Weapon

func perform_shoot(dir:Vector2, shooter:Node2D):
	var laser = weapon_scene.instantiate()
	
	laser.dir = dir 
	laser.shooter = shooter
	laser.damage = damage
	
	shooter.get_parent().add_child(laser)
	laser.position = shooter.global_position
