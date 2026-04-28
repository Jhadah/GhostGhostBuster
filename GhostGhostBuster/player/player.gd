extends CharacterBody2D

#--movement--#
@export var speed:float = 100.0
@export var hp:float = 5.0
var is_facing_left:bool = true
var is_dead:bool = false

#--attack system--# 
var enemies_in_range:Array[CharacterBody2D] = []
@onready var weapon_manager:Node = $"weapon-manager"

func _ready() -> void:
	Global.Player = self
	$"animation".play("player-side")

func _input(event: InputEvent) -> void:
	var dir = Input.get_vector("left","right","up","down")
	velocity = dir * speed
	manage_sprite_orientation(dir)
	
	if event.is_action_pressed("die"):
		die()

func _physics_process(_delta: float) -> void:
	move_and_slide()
	get_nearest_enemy_direction()

func manage_sprite_orientation(dir):
	if dir.x < 0:
		is_facing_left = false
	elif dir.x > 0:
		is_facing_left = true
	
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
	weapon_manager.update_target(nearest_enemy)
#endregion --shooting system--#

func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		take_damage()

func take_damage():
	hp -= 1
	if hp <= 0:
		die()

func die():
	Global.player_died.emit()
	
	is_dead = true
	visible = false
	set_physics_process(false)
	
