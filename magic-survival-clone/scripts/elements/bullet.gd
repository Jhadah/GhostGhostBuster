extends CharacterBody2D

var dir:Vector2
#--stats--
@export var speed:int = 400

func _ready() -> void:
	$AnimatedSprite2D.play("default")
	rotation = dir.angle() - PI #perchè lo sprite punta a sinistra

func _process(delta: float) -> void:
	velocity = dir * speed
	var collision = move_and_collide(velocity*delta)
	if collision: 
		var collider:Enemy = collision.get_collider()
		if collider.is_in_group("enemy"):
			collider.take_damage(Global.bullet_damage)
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
