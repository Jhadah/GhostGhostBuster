extends Node

signal exp_gained
signal level_increased(level:int)
signal player_died
signal permanent_ability_upgraded

var Viewport_Size:Vector2
var Player:CharacterBody2D    #viene assegnato nel nodo player
var n_enemies_alive:int = 0

var level:int = 1

var current_exp:int = 0
var exp_gain:int = 10
var max_exp:float = 40
var max_xp_growth:int = 20

func _ready() -> void:
	Viewport_Size = get_tree().root.get_visible_rect().size

func enemy_spawned():
	n_enemies_alive +=1
func enemy_died():
	gain_exp()
	n_enemies_alive -= 1

func level_up():
	level += 1
	current_exp = 0
	level_increased.emit(level)
	max_exp += max_xp_growth

func gain_exp():
	current_exp += exp_gain
	exp_gained.emit()
	
	if current_exp >= max_exp:
		level_up()

func custom_timer(custom_time:float):
	return get_tree().create_timer(custom_time).timeout
