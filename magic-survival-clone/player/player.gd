extends CharacterBody2D

#--movement--#
@export var speed:int = 100
var is_facing_left:bool = true

#--attack system--# 
var enemies_in_range:Array[CharacterBody2D] = []
@onready var weapon:Node = $"weapon-manager"

func _ready() -> void:
	Global.Player = self
	$"animation".play("player-side")

func _physics_process(_delta: float) -> void:
	move_and_slide()
	get_nearest_enemy_direction()
	
func _input(_event: InputEvent) -> void:
	var dir = Input.get_vector("left","right","up","down")
	velocity = dir * speed
	manage_sprite_orientation(dir)

func manage_sprite_orientation(dir):
	if dir.x < 0:
		is_facing_left = true
	elif dir.x > 0:
		is_facing_left = false
	
	$"animation".flip_h = !is_facing_left

#region enemy detection system
func _on_detection_range_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemies_in_range.append(body)
func _on_detection_range_body_exited(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemies_in_range.erase(body)

func get_nearest_enemy_direction():
	var nearest_enemy: Node2D = null
	var min_dist:float = INF
	for enemy in enemies_in_range:
		var enemy_dist = enemy.global_position.distance_to(global_position)
		if enemy_dist < min_dist:
			nearest_enemy = enemy
			min_dist = enemy_dist
	weapon.update_target(nearest_enemy)
#endregion --shooting system--#
