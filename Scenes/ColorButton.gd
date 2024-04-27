extends Node2D

var button_color
var main_scene

func _ready():
	main_scene = get_tree().current_scene
	
func update_style(new_color : Color):
	button_color = new_color
	$Button.modulate = new_color

func _on_button_pressed():
	main_scene.get_node("Control").color = button_color
	main_scene.get_node("Control").cursor_color(0.5)
	main_scene.get_node("OpacitySlider").get_node("ColorPickerButton").modulate = Color(button_color.r, button_color.g, button_color.b)
	
func _on_button_mouse_entered():
	main_scene.get_node("Control").mouse_cursor_visibility(true)
	main_scene.get_node("Control").cursor_color(0)

func _on_button_mouse_exited():
	main_scene.get_node("Control").mouse_cursor_visibility(false)
	main_scene.get_node("Control").cursor_color(0.5)
