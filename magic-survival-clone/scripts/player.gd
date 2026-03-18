extends CharacterBody2D

#--stats--
@export var speed:int = 100

#--utils--
@export var bullet_scene:PackedScene
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

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

func manage_sprite_orientation(dir):
	if dir.x < 0:
		is_facing_left = true
	elif dir.x > 0:
		is_facing_left = false
	
	$"player-sprite".flip_h = ! is_facing_left

func shoot():
	var target_dir = get_global_mouse_position()
	var bullet = bullet_scene.instantiate()
	bullet.dir = (target_dir - global_position).normalized()
	bullet.position = global_position
	
	get_parent().add_child(bullet)
	print("pow")
