extends Label

func _ready() -> void:
	Global.level_increased.connect(_on_level_increased)

func _on_level_increased():
	text = str(Global.level)
