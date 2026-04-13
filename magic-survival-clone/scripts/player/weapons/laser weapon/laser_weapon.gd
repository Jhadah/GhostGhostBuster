extends Weapon
class_name LaserWeapon

func shoot(dir:Vector2, shooter:Node2D):
	var laser = weapon_scene.instantiate()
	laser.dir = dir 
	laser.position = shooter.global_position
	
	shooter.get_parent().add_child(laser)
