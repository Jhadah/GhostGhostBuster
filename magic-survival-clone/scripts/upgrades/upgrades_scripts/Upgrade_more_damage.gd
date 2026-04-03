extends Resource
class_name Upgrade_more_damage

@export var bonus_damage:float = 1.0

func apply(stats:Dictionary) -> void:
	stats["damage"] += bonus_damage
