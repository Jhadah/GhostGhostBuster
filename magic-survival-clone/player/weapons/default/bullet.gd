extends CharacterBody2D

var dir:Vector2
var speed:float
var damage:float
var texture:SpriteFrames

func _ready() -> void:
	$animation.sprite_frames = texture
	$animation.play("default")
	rotation = dir.angle() - PI #perchè lo sprite punta a sinistra

func _process(delta: float) -> void:
	velocity = dir * speed
	var collision = move_and_collide(velocity*delta)
	if collision: 
		var collider = collision.get_collider()
		if collider.is_in_group("enemy"):
			collider.take_damage(damage)
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
