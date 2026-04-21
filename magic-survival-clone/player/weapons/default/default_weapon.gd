class_name DefaultWeapon
extends Weapon

var multiple_shots_delay:float = 0.1

func perform_shoot(dir:Vector2, shooter:Node2D):
	for i in range(int(count)):
		var fireball = weapon_scene.instantiate()
		
		fireball.position = shooter.global_position
		fireball.dir = dir
		fireball.speed = speed
		fireball.damage = damage
		
		shooter.get_parent().add_child(fireball)
		await Global.custom_timer(multiple_shots_delay)
