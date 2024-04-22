extends Node2D

var button_color

func update_style(new_color : Color):
	$Button.modulate = new_color
	button_color = new_color

func _on_button_pressed():
	get_tree().current_scene.get_node("Control").color = button_color
	get_tree().current_scene.get_node("Control").cursor_color(0.5)

func _on_button_mouse_entered():
	get_tree().current_scene.get_node("Control").mouse_cursor_visibility(true)
	get_tree().current_scene.get_node("Control").cursor_color(0)

func _on_button_mouse_exited():
	get_tree().current_scene.get_node("Control").mouse_cursor_visibility(false)
	get_tree().current_scene.get_node("Control").cursor_color(0.5)
