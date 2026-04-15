extends Node

signal exp_gained
signal level_increased

var Viewport_Size:Vector2
var Player:CharacterBody2D    #viene assegnato nel nodo player
var n_enemies_alive:int = 0

var level:int = 1
var level_cap:int = 10

var current_exp:int = 0
var exp_threshold:int = 100

func _ready() -> void:
	Viewport_Size = get_tree().root.get_visible_rect().size

func enemy_spawned():
	n_enemies_alive +=1
func enemy_died():
	gain_exp()
	n_enemies_alive -= 1

func level_up():
	if level < level_cap:
		level += 1
		level_increased.emit()
		current_exp = 0

func gain_exp():
	current_exp += (exp_threshold / level) / 4
	exp_gained.emit()
