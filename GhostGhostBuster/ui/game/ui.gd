extends Control

@onready var pause_menu = $pause_menu
@onready var resume_btn = $pause_menu/resume_button
@onready var lvl_label = $basic_ui/level_label
@onready var progress_bar = $basic_ui/progress_bar
@onready var item_list = $basic_ui/ItemList

func _ready() -> void:
	Global.level_increased.connect(on_level_up)
	Global.exp_gained.connect(_on_exp_gained)
	resume_btn.pressed.connect(_on_resume_button_pressed)

func on_level_up():
	item_list.appear()
	lvl_label.text = "lvl" + str(Global.level)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		pause_menu.visible = !pause_menu.visible
	
func _on_exp_gained():
	progress_bar.value = Global.current_exp

func _on_resume_button_pressed():
	get_tree().paused = false
	pause_menu.visible = false

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://dpyitus2qvfmd")
