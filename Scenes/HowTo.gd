extends Node2D

var main_scene

func _ready():
	main_scene = get_tree().current_scene

func _on_button_back_mouse_entered():
	main_scene.get_node("Control").mouse_cursor_visibility(true)
	main_scene.get_node("Control").cursor_color(0)

func _on_button_back_mouse_exited():
	main_scene.get_node("Control").mouse_cursor_visibility(false)
	main_scene.get_node("Control").cursor_color(0.5)

func _on_button_back_pressed():
	self.visible = false
