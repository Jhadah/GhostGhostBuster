class_name LaserWeapon
extends Weapon

@export var count:int = 1

func perform_shoot(dir:Vector2, shooter:Node2D):
	for i in range(count):
		var rand_dir = randf_range(0, TAU)
		
		var laser = weapon_scene.instantiate()
		
		laser.dir = Vector2.from_angle(rand_dir)
		laser.shooter = shooter
		laser.damage = damage
		laser.texture = texture
		
		shooter.get_parent().add_child(laser)
		laser.position = shooter.global_position
