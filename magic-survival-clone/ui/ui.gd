extends Control

func _ready() -> void:
	Global.level_increased.connect(on_level_up)

func on_level_up():
	$ItemList.appear()
