extends Control

@onready var pause_menu = $"pause_menu"
@onready var item_list = $game_ui/ItemList
@onready var resume_button = $pause_menu/resume_button

func _ready() -> void:
	Global.level_increased.connect(on_level_increased)
	resume_button.pressed.connect(_on_resume_button_pressed)

func on_level_increased(_level:int):
	item_list.appear()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		pause_menu.visible = !pause_menu.visible

func _on_resume_button_pressed():
	pause_menu.visible = false
	get_tree().paused = false

func _on_exit_button_pressed() -> void:
	get_tree().paused = false
	get_tree().quit()

func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("uid://dpyitus2qvfmd")
