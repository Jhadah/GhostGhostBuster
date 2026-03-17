extends CharacterBody2D

#--stats--
@export var speed:int = 100

#--utils--
var bullet_scene:PackedScene
var is_facing_left:bool = true 


func _ready() -> void:
	Global.player = self
	
	$"player-sprite".play("default")
	$"flame-sprite".play("default")

func _physics_process(_delta: float) -> void:
	var dir = Input.get_vector("left","right","up","down")
	velocity = dir * speed
	move_and_slide()
	
	manage_sprite_orientation(dir)

#region funcs

func manage_sprite_orientation(dir):
	if dir.x < 0:
		is_facing_left = true
	elif dir.x > 0:
		is_facing_left = false
	
	$"player-sprite".flip_h = ! is_facing_left

func check_nearest_enemy(): 
	var nearest:CharacterBody2D = null
	var min_distance:float = INF
	
	for enemy in $attackRange.enemies_in_range:
		var dist:float = global_position.distance_to(enemy.global_position)
		
		if dist < min_distance:
			min_distance = dist
			nearest = enemy
	return nearest

func shoot():
	var shoot_dir = check_nearest_enemy()
	if !shoot_dir:
		return
	
	var bullet = bullet_scene.instantiate() 
	bullet.dir = shoot_dir
	
	get_parent().add_child(bullet)

#endregion
