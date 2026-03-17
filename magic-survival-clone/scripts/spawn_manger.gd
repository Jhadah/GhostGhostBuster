extends Node2D

@export var enemy_scene:PackedScene
@export var player: CharacterBody2D
var enemy_cap:int = 300

var spawn_distance:int = 900

func spawn_enemy():
	if Global.n_enemies_alive > enemy_cap:
		return
		
	var rand_angle:float = randf_range(0, TAU)
	var spawn_pos:Vector2 = player.global_position + Vector2.from_angle(rand_angle) * spawn_distance
	
	var enemy = enemy_scene.instantiate()
	enemy.position = spawn_pos
	enemy.dir = player.global_position
	
	get_parent().add_child(enemy)
	print("nemico spawnato")


func _on_timer_timeout() -> void:
	var amount_of_enemies = randi_range(3,5)
	for i in range(amount_of_enemies):
		spawn_enemy()
