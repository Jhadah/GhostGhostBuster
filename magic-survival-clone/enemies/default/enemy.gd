extends Enemy

func _ready() -> void:
	hp = 2
	speed = 400
	$animation.play("default")
	super()
