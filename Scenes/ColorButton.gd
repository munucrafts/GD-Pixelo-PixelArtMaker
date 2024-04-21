extends Node2D

var button_color

func update_style(new_color : Color):
	$Button.modulate = new_color
	button_color = new_color

func _on_button_pressed():
	get_tree().current_scene.color = button_color
	print($Button.modulate)
