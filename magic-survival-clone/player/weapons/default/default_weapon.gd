extends Weapon
class_name DefaultWeapon

func perform_shoot(dir:Vector2, shooter:Node2D):
	var bullet = weapon_scene.instantiate()
	
	bullet.position = shooter.global_position
	bullet.dir = dir
	bullet.speed = speed
	bullet.damage = damage
	
	shooter.get_parent().add_child(bullet)
