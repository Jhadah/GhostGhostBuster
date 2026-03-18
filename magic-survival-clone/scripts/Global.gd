extends Node

var Viewport_Size:Vector2
var player:CharacterBody2D
var n_enemies_alive:int = 0

func _ready() -> void:
	Viewport_Size = get_tree().root.get_visible_rect().size

func enemy_spawned():
	n_enemies_alive +=1
func enemy_died():
	n_enemies_alive -= 1
