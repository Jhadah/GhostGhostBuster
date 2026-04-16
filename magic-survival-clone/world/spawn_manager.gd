extends Node2D

@export var enemy_scene:PackedScene
var enemy_cap:int = 300

var spawn_distance:int = 800
@export var spawn_min:int = 1
@export var spawn_max:int = 4
@onready var spawn_rates = preload("res://world/spawn_rates.tres")

var enemy_stats:Dictionary = {}
@onready var default_enemy_stats = preload("res://enemies/default/default_enemy_stats.tres")
@onready var tough_enemy_stats = preload("res://enemies/tough/tough_enemy_stats.tres")
@onready var speed_enemy_stats = preload("res://enemies/speed/speed_enemy_stats.tres")


func _ready() -> void:
	enemy_stats = {
		default_enemy_stats: spawn_rates.default_enemy,
		tough_enemy_stats: spawn_rates.tough_enemy,
		speed_enemy_stats: spawn_rates.speed_enemy,
	}

func spawn_enemy():
	if Global.n_enemies_alive > enemy_cap:
		return
		
	var rand_angle:float = randf_range(0, TAU)
	var spawn_pos:Vector2 = Global.Player.global_position + Vector2.from_angle(rand_angle) * spawn_distance
	
	var enemy:Enemy = enemy_scene.instantiate()
	
	enemy.stats = get_random_enemy_stats()
	enemy.position = spawn_pos
	
	get_parent().add_child(enemy)

func get_random_enemy_stats():
	var rand:float = randf()
	var acc:float = 0
	
	for res in enemy_stats:
		acc += enemy_stats[res]
		if rand <= acc:
			return res

func _on_spawn_timer_timeout() -> void:
	var amount_of_enemies = randi_range(spawn_min,spawn_max)
	for i in range(amount_of_enemies):
		spawn_enemy()
