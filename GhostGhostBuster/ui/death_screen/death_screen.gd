extends Control

var deathscreens:Array = [
	preload("uid://8et6qydy3jps"),
	preload("uid://cbnxup0xxwqhs"),
	preload("uid://dhcap85m8onj8"),
	preload("uid://djxwtta40mu2v"),
	preload("uid://c8ougdntmppq5"),
]

func _ready() -> void:
	Global.player_died.connect(_on_player_died)

func _on_player_died():
	visible = true
	var random = randi_range(0, deathscreens.size() - 1)
	$death_word.texture = deathscreens[random]
