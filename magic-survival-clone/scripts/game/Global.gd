extends Node

var Viewport_Size:Vector2
var Player:CharacterBody2D    #viene assegnato nel nodo player
var n_enemies_alive:int = 0
var bullet_damage:int = 1

func _ready() -> void:
	Viewport_Size = get_tree().root.get_visible_rect().size

func enemy_spawned():
	n_enemies_alive +=1
func enemy_died():
	n_enemies_alive -= 1
