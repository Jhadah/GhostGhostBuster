class_name SatelliteWeapon
extends Weapon

@export var dist_from_center:float
@export var rotation_speed:float
@export var satellite_size:float
@export var count:int

var max_count:int = 8    #METTERE LOGICA DI LIMITE

var active_satellites:Array = []

func activate_permanent_ability(shooter:Node2D):
	active_satellites.clear()

	for i in range(count):
		var satellite = weapon_scene.instantiate()
		active_satellites.append(satellite)
	
	var circle_section = TAU / count
	for i in active_satellites.size():
		active_satellites[i].damage = damage
		active_satellites[i].center = shooter
		active_satellites[i].dist = dist_from_center
		active_satellites[i].rot_spd = rotation_speed
		active_satellites[i].texture = texture
		active_satellites[i].rot = circle_section * i
		shooter.get_parent().add_child(active_satellites[i])
