extends Area2D

var enemies_in_range:Array[CharacterBody2D] = []

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemies_in_range.append(body)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		if enemies_in_range.has(body):
			enemies_in_range.erase(body)



#func _on_timer_timeout() -> void:
	#check_nearest_enemy()
