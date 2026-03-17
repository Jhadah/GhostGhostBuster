extends Node

var Viewport_Size:Vector2
var player:CharacterBody2D
var n_enemies_alive:int

func _ready() -> void:
	Viewport_Size = get_tree().root.get_visible_rect().size
