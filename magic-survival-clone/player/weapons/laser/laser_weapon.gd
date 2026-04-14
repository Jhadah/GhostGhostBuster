extends Weapon
class_name LaserWeapon

func perform_shoot(dir:Vector2, shooter:Node2D):
	var laser = weapon_scene.instantiate()
	laser.position = shooter.global_position
	laser.dir = dir 
	laser.shooter = shooter
	laser.damage = damage
	
	shooter.get_parent().add_child(laser)
