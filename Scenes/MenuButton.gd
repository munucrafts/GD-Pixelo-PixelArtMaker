extends Node2D

var main_scene

func _ready():
	main_scene = get_tree().current_scene
	
func _on_button_pressed():
	match $Button.text:
		"New":
			get_tree().change_scene_to_file("res://Scenes/control.tscn")
		"Export":
			main_scene.get_node("ExportSettings").visible = not main_scene.get_node("ExportSettings").visible
		"How to?":
			main_scene.get_node("HowTo").visible = not main_scene.get_node("HowTo").visible
				

func _on_button_mouse_entered():
	main_scene.get_node("Control").mouse_cursor_visibility(true)
	main_scene.get_node("Control").cursor_color(0)

func _on_button_mouse_exited():
	main_scene.get_node("Control").mouse_cursor_visibility(false)
	main_scene.get_node("Control").cursor_color(0.5)

func set_button_name(name: String):
	$Button.text = name
