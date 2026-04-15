extends ProgressBar

func _ready() -> void:
	Global.exp_gained.connect(_on_exp_gained)
	value = 0

func _on_exp_gained():
	value = Global.current_exp
