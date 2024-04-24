extends Node2D

@onready var main_scene = get_tree().current_scene

func _ready():
	$ColorPickerButton.modulate = main_scene.get_node("Control").color
	$ColorPickerButton.get_theme_stylebox("normal").bg_color.a = 255
	
func _on_h_slider_mouse_entered():
	get_tree().current_scene.get_node("Control").mouse_cursor_visibility(true)
	get_tree().current_scene.get_node("Control").cursor_color(0)
	
func _on_h_slider_mouse_exited():
	get_tree().current_scene.get_node("Control").mouse_cursor_visibility(false)
	get_tree().current_scene.get_node("Control").cursor_color(0.5)

func _on_h_slider_value_changed(value):
	get_tree().current_scene.get_node("Control").opacity = $HSlider.value / 100
	$ColorPickerButton.get_theme_stylebox("normal").bg_color.a = $HSlider.value / 100

