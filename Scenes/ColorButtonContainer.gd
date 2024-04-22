extends Node2D

var button_scene = preload("res://Scenes/ColorButton.tscn")
var pixel_colors = [
	Color(255, 0, 0, 255),       # Red
	Color(0, 255, 0, 255),       # Lime
	Color(0, 0, 255, 255),       # Blue
	Color(255, 255, 0, 255),     # Yellow
	Color(255, 127, 0, 255),     # Orange
	Color(255, 0, 255, 255),     # Magenta
	Color(0, 255, 255, 255),     # Cyan
	Color(128, 0, 0, 255),       # Maroon
	Color(0, 128, 0, 255),       # Green
	Color(0, 0, 128, 255),       # Navy
	Color(128, 128, 0, 255),     # Olive
	Color(128, 0, 128, 255),     # Purple
	Color(0, 128, 128, 255),     # Teal
	Color(255, 105, 180, 255),   # Hot Pink
	Color(255, 215, 0, 255),     # Gold
	Color(255, 69, 0, 255),      # Red-Orange
	Color(65, 105, 225, 255),    # Royal Blue
	Color(255, 0, 255, 255),     # Fuchsia
	Color(218, 112, 214, 255),   # Orchid
	Color(0, 191, 255, 255),     # Deep Sky Blue
	Color(255, 20, 147, 255),    # Deep Pink
	Color(128, 0, 128, 255),     # Medium Purple
	Color(255, 140, 0, 255),     # Dark Orange
	Color(0, 255, 255, 255),     # Aqua
	Color(255, 255, 255, 255)    # White
]

func _ready():
	var initial_position = Vector2(5, 0)
	for i in range(6):
		var row_position = initial_position + Vector2(0, i * 32 + 5)
		for j in range(4):
			var button_position = row_position + Vector2(j * 32, 0)
			var button_instance = button_scene.instantiate()
			add_child(button_instance)
			button_instance.position = button_position
			var color_index = i * 4 + j
			var color = pixel_colors[color_index]
			button_instance.update_style(color)

