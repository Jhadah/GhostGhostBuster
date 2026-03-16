extends CharacterBody2D

var speed:int = 100

func _ready() -> void:
	$AnimatedSprite2D.play("default")

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("left","right","up","down")
	velocity = dir * speed
	move_and_slide()
	
	manage_image_flip(dir)

func manage_image_flip(dir):
	if dir.x > 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
		
