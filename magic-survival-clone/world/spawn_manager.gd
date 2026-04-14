extends Node2D

@export var enemy_scene:PackedScene
var enemy_cap:int = 300

var spawn_distance:int = 800
@export var enemies_min_amount:int = 1
@export var enemies_max_amount:int = 4

func spawn_enemy():
	if Global.n_enemies_alive > enemy_cap:
		return
		
	var rand_angle:float = randf_range(0, TAU)
	var spawn_pos:Vector2 = Global.Player.global_position + Vector2.from_angle(rand_angle) * spawn_distance
	
	var enemy = enemy_scene.instantiate()
	enemy.position = spawn_pos
	
	get_parent().add_child(enemy)

func _on_spawn_timer_timeout() -> void:
	var amount_of_enemies = randi_range(enemies_min_amount,enemies_max_amount)
	for i in range(amount_of_enemies):
		spawn_enemy()
