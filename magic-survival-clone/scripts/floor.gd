extends Sprite2D

@export var player:CharacterBody2D

func _process(_delta: float) -> void:
	region_rect =  Rect2(player.global_position,Global.Viewport_Size*1.5)
