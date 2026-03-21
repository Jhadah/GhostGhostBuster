extends CharacterBody2D

#--stats--#
@export var speed:int = 100
#--attack system--# 
var enemies_in_range:Array[CharacterBody2D] = []
@export var bullet_scene:PackedScene
enum Orientation {RIGHT, LEFT, UP, DOWN}
var current_orientation = Orientation.LEFT

var is_facing_left:bool = true

func _ready() -> void:
	Global.Player = self	

func _physics_process(_delta: float) -> void:
	var dir = Input.get_vector("left","right","up","down")
	velocity = dir * speed
	move_and_slide()
	
	manage_sprite_orientation(dir)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

func manage_sprite_orientation(dir):
	
	if dir.x < 0 and dir.y == 0:
		current_orientation = Orientation.LEFT
	if dir.x > 0 and dir.y == 0:
		current_orientation = Orientation.RIGHT
	if dir.y < 0 and dir.x == 0:
		current_orientation = Orientation.UP
	if dir.y > 0 and dir.x == 0:
		current_orientation = Orientation.DOWN
	
	match current_orientation:
		Orientation.RIGHT:
			$"player-sprite".play("player-side")
			$"player-sprite".flip_h = true
		Orientation.LEFT:
			$"player-sprite".play("player-side")
			$"player-sprite".flip_h = false
		Orientation.UP:
			$"player-sprite".play("player-up")
			$"player-sprite".flip_h = false
		Orientation.DOWN:
			$"player-sprite".play("player-down")
			$"player-sprite".flip_h = false
		

#region --shooting system--#
func shoot():
	var nearest_enemy = get_nearest_enemy()
	if !nearest_enemy:
		return
	var target_dir = nearest_enemy.global_position
	var bullet = bullet_scene.instantiate()
	bullet.dir = (target_dir - global_position).normalized()
	bullet.position = global_position
	
	get_parent().add_child(bullet)

func _on_detection_range_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemies_in_range.append(body)
func _on_detection_range_body_exited(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemies_in_range.erase(body)

func get_nearest_enemy():
	var nearest_enemy: Node2D = null
	var min_dist:float = INF
	for enemy in enemies_in_range:
		var enemy_dist = enemy.global_position.distance_to(global_position)
		if enemy_dist < min_dist:
			nearest_enemy = enemy
			min_dist = enemy_dist
	print(nearest_enemy)
	return nearest_enemy

func _on_timer_timeout() -> void:
	shoot()
#endregion --shooting system--#
