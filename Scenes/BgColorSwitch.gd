extends Node2D

@onready var main_scene = get_tree().current_scene

func _ready():
	$ColorPickerButton.modulate = main_scene.get_node("Control").color
	$ColorPickerButton.get_theme_stylebox("normal").bg_color.a = main_scene.get_node("Control").opacity

func _on_color_picker_button_mouse_entered():
	get_tree().current_scene.get_node("Control").mouse_cursor_visibility(true)
	get_tree().current_scene.get_node("Control").cursor_color(0)

func _on_color_picker_button_pressed():
	main_scene.get_node("Control").get_node("ControlBG").modulate = main_scene.get_node("Control").color
	$ColorPickerButton.modulate = main_scene.get_node("Control").color
	
func _on_color_picker_button_mouse_exited():
	get_tree().current_scene.get_node("Control").mouse_cursor_visibility(false)
	get_tree().current_scene.get_node("Control").cursor_color(0.5)
