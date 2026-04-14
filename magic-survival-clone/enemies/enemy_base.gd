class_name Enemy
extends CharacterBody2D

@export var stats:EnemyStats

var dir:Vector2

func get_target_dir(target_dir:Vector2):
	dir = target_dir
	
