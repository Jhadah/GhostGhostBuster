extends Sprite2D

func _process(_delta: float) -> void:
	region_rect =  Rect2(Global.Player.global_position,Global.Viewport_Size*1.5)
