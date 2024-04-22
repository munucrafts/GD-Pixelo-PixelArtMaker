extends Control

func _ready():
	create_canvas()

func create_canvas():
	var bg_color = $"../Control".bg_color
	var canvas_size = $"../Control".canvas_size
	var pixels = []
	
	for x in range(canvas_size.x):
		var column = []
		for y in range(canvas_size.y):
			column.append(bg_color)
		pixels.append(column)
