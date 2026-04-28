extends Control

func _ready() -> void:
	Global.level_increased.connect(on_level_up)
	$pause_menu/resume_button.pressed.connect(_on_resume_button_pressed)

func on_level_up(_level:int):
	$basic_ui/ItemList.appear()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		$pause_menu.visible = !$pause_menu.visible

func _on_resume_button_pressed():
	get_tree().paused = false
	$pause_menu.visible = false

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://dpyitus2qvfmd")
