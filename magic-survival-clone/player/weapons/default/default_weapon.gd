class_name DefaultWeapon
extends Weapon

var multiple_shots_delay:float = 0.1

func perform_shoot(dir:Vector2, shooter:Node2D):
	#print("entrato nella funzione performshoot di defautl weapon")
	for i in range(int(count)):
		print("iterazione numero", i, "del ciclo di fire")
		var bullet = weapon_scene.instantiate()
		
		bullet.position = shooter.global_position
		bullet.dir = dir
		bullet.speed = speed
		bullet.damage = damage
		
		shooter.get_parent().add_child(bullet)
		await Global.custom_timer(multiple_shots_delay)
