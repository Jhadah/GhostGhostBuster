class_name SatelliteWeapon
extends Weapon

@export var dist_from_center:float
@export var rotation_speed:float
@export var satellite_size:float
@export var count:int

func activate_permanent_ability(shooter:Node2D):
	for i in range(count):
		var satellite = weapon_scene.instantiate()
		
		satellite.damage = damage
		satellite.center = shooter
		satellite.dist = dist_from_center
		satellite.rot_spd = rotation_speed
