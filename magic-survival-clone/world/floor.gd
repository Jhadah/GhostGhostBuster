extends Sprite2D

func _ready() -> void:
	region_rect.size = get_viewport_rect().size

func _process(delta: float) -> void:
	region_rect.position = Global.Player.position * 1.5
