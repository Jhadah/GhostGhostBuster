extends Enemy

func _ready() -> void:
	hp = 2
	speed = 100
	$animation.play("default")
	super()
