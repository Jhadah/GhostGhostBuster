extends Node2D

@export var enemy_scene:PackedScene
@export var player: CharacterBody2D

var spawn_distance:int = 200

func _ready() -> void:
	spawn_enemy()

func spawn_enemy():
	var rand_angle:float = randf_range(0, TAU)
	var spawn_pos:Vector2 = (player.global_position + Vector2.from_angle(rand_angle)).normalized() * spawn_distance
	
	var enemy = enemy_scene.instantiate()
	enemy.position = spawn_pos
	enemy.dir = player.global_position
	
	get_parent().add_child(enemy)
	
	print(spawn_pos)
