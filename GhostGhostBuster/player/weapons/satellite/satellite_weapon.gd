class_name SatelliteWeapon
extends Weapon

@export var dist_from_center:float
@export var rotation_speed:float
@export var satellite_size:float
@export var count:int

var max_count:int = 8 

var active_satellites:Array = []

func activate_permanent_ability(shooter:Node2D):
	active_satellites.clear()
	
	for i in range(count):
		var satellite = weapon_scene.instantiate()
		
		#satellite.damage = damage
		satellite.center = shooter
		satellite.dist = dist_from_center
		satellite.rot_spd = rotation_speed
		active_satellites.append(satellite)
	
	var circle_section = TAU / count
	for i in active_satellites.size():
		active_satellites[i].rot = circle_section * i
		weapon_scene.instantiate()
		shooter.get_parent().add_child(active_satellites[i])
