class_name PulsarWeapon
extends Weapon

@export var count:int
@export var shots_delay:float = 0.1

func perform_shoot(dir:Vector2, shooter:Node2D):
	for i in range(count):
		var pulse = weapon_scene.instantiate()
		pulse.dir = dir
		shooter.get_parent().add_child(pulse)
		pulse.global_position = shooter.global_position
		await Global.custom_timer(shots_delay)
