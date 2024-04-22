extends Node2D

func _ready():
	$ColorPickerButton.modulate = get_tree().current_scene.get_node("Control").color
	
func _on_h_slider_mouse_entered():
	get_tree().current_scene.get_node("Control").mouse_cursor_visibility(true)
	get_tree().current_scene.get_node("Control").cursor_color(0)
	
func _on_h_slider_mouse_exited():
	get_tree().current_scene.get_node("Control").mouse_cursor_visibility(false)
	get_tree().current_scene.get_node("Control").cursor_color(0.5)

func _on_h_slider_value_changed(value):
	get_tree().current_scene.get_node("Control").opacity = $HSlider.value / 100
	$ColorPickerButton.modulate.a = $HSlider.value / 100
