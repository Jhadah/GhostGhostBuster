extends Enemy


func _ready() -> void:
	hp = 2
	speed = 100
	
	$AnimatedSprite2D.play("default")
	
	super()
