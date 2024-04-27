extends Node2D

var button_scene = preload("res://Scenes/ColorButton.tscn")
var color_index = 0
var pixel_colors = [
	Color(1.0, 0.0, 0.0, 1.0),         # Red
	Color(0.0, 1.0, 0.0, 1.0),         # Lime
	Color(0.0, 0.0, 1.0, 1.0),         # Blue
	Color(1.0, 1.0, 0.0, 1.0),         # Yellow
	Color(1.0, 0.5, 0.0, 1.0),         # Orange
	Color(1.0, 0.0, 1.0, 1.0),         # Magenta
	Color(0.0, 1.0, 1.0, 1.0),         # Cyan
	Color(0.5, 0.0, 0.0, 1.0),         # Maroon
	Color(0.0, 0.5, 0.0, 1.0),         # Green
	Color(0.0, 0.0, 0.5, 1.0),         # Navy
	Color(0.5, 0.5, 0.0, 1.0),         # Olive
	Color(0.5, 0.0, 0.5, 1.0),         # Purple
	Color(0.0, 0.5, 0.5, 1.0),         # Teal
	Color(1.0, 0.105, 0.706, 1.0),     # Hot Pink
	Color(1.0, 0.843, 0.0, 1.0),       # Gold
	Color(1.0, 0.271, 0.0, 1.0),       # Red-Orange
	Color(0.255, 0.412, 0.882, 1.0),   # Royal Blue
	Color(1.0, 0.0, 1.0, 1.0),         # Fuchsia
	Color(0.855, 0.439, 0.839, 1.0),   # Orchid
	Color(0.0, 0.749, 1.0, 1.0),       # Deep Sky Blue
	Color(1.0, 0.078, 0.576, 1.0),     # Deep Pink
	Color(0.502, 0.0, 0.502, 1.0),     # Medium Purple
	Color(1.0, 0.549, 0.0, 1.0),       # Dark Orange
	Color(0.0, 1.0, 1.0, 1.0),         # Aqua
	Color(1.0, 1.0, 1.0, 1.0),         # White
	Color(0.0, 0.392, 0.0, 1.0),       # Dark Green
	Color(0.0, 0.6, 0.6, 1.0),         # Turquoise
	Color(0.502, 0.502, 0.502, 1.0),   # Gray
	Color(0.627, 0.322, 0.176, 1.0),   # Brown
	Color(0.941, 0.902, 0.549, 1.0),   # Beige
	Color(0.412, 0.412, 0.412, 1.0),   # Dim Gray
	Color(0.529, 0.808, 0.922, 1.0),   # Light Sky Blue
	Color(0.416, 0.353, 0.804, 1.0),   # Slate Blue
	Color(0.663, 0.663, 0.663, 1.0),   # Light Gray
	Color(0.871, 0.722, 0.529, 1.0),   # Tan
	Color(0.0, 0.502, 0.251, 1.0),     # Spring Green
	Color(0.275, 0.51, 0.706, 1.0),    # Steel Blue
	Color(0.863, 0.863, 0.863, 1.0),   # Gainsboro
	Color(0.804, 0.522, 0.247, 1.0),   # Peru
	Color(0.0, 0.502, 0.502, 1.0),     # Medium Aquamarine
	Color(0.18, 0.545, 0.341, 1.0),    # Sea Green
	Color(0.282, 0.239, 0.545, 1.0),   # Slate Blue
	Color(0.961, 0.871, 0.702, 1.0)    # Burly Wood
]

func _ready():
	var initial_position = Vector2(5, 0)
	for i in range(8):
		var row_position = initial_position + Vector2(0, i * 32 + 5)
		for j in range(4):
			var button_position = row_position + Vector2(j * 32, 0)
			var button_instance = button_scene.instantiate()
			add_child(button_instance)
			button_instance.position = button_position
			var color = pixel_colors[color_index]
			button_instance.update_style(color)
			color_index += 1

