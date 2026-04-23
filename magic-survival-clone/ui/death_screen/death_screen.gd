extends Control

var deathscreens:Array = [
	preload("res://ui/death_screen/death_screen1.png"),
	preload("res://ui/death_screen/death_screen2.png"),
	preload("res://ui/death_screen/death_screen3.png"),
	preload("res://ui/death_screen/death_screen4.png")
]

func _ready() -> void:
	Global.player_died.connect(_on_player_died)

func _on_player_died():
	visible = true
	var random = randi_range(0, deathscreens.size() - 1)
	$death_word.texture = deathscreens[random]
