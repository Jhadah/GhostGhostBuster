extends Control

func _ready() -> void:
	Global.exp_gained.connect(_on_exp_gained)
	Global.level_increased.connect(_on_level_increased)

func _on_exp_gained():
	$"progress-bar".value = Global.current_exp

func _on_level_increased():
	$"level-label".text = "lvl" + str(Global.level)
