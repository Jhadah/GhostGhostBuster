extends CharacterBody2D

#--stats--
@export var speed:int = 100

#--utils--
var is_facing_left:bool = true 

func _ready() -> void:
	Global.player = self
	
	$"player-sprite".play("default")
	$"flame-sprite".play("default")

func _physics_process(_delta: float) -> void:
	var dir = Input.get_vector("left","right","up","down")
	velocity = dir * speed
	move_and_slide()
	
	manage_sprite_orientation(dir)

#region funcs

func manage_sprite_orientation(dir):
	if dir.x < 0:
		is_facing_left = true
	elif dir.x > 0:
		is_facing_left = false
	
	$"player-sprite".flip_h = ! is_facing_left

#endregion
