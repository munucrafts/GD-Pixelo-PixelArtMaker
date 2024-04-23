extends Node2D

func _on_h_slider_mouse_entered():
	get_tree().current_scene.get_node("Control").mouse_cursor_visibility(true)
	get_tree().current_scene.get_node("Control").cursor_color(0)
	
func _on_h_slider_mouse_exited():
	get_tree().current_scene.get_node("Control").mouse_cursor_visibility(false)
	get_tree().current_scene.get_node("Control").cursor_color(0.5)

func _on_h_slider_value_changed(value):
	$ColorPickerButton.text = "Pixel Size - " + str($HSlider.value)
	get_tree().current_scene.get_node("Control").pixel_size_multiplier = $HSlider.value / get_tree().current_scene.get_node("Control").pixel_size

