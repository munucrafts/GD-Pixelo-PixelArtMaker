extends Control

var pixel_size = 8
var screen_size = DisplayServer.window_get_size()
var canvas_size = Vector2(screen_size.x / pixel_size, screen_size.y / pixel_size)
var pixels = [] # 2D array to store pixel colors
var color = Color(0, 0, 1) # Green color

func _ready():
	# Initialize the canvas with transparent pixels
	for x in range(canvas_size.x):
		var column = []
		for y in range(canvas_size.y):
			column.append(Color(1, 1, 1, 1)) # Transparent
		pixels.append(column)

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		draw_pixel(get_global_mouse_position())
		queue_redraw()

func draw_pixel(position):
	var x = int(position.x / pixel_size)
	var y = int(position.y / pixel_size)

	# Check if the pixel coordinates are within the canvas bounds
	if x >= 0 and x < canvas_size.x and y >= 0 and y < canvas_size.y:
		pixels[x][y] = color

func _draw():
	for x in range(canvas_size.x):
		for y in range(canvas_size.y):
			draw_rect(Rect2(x * pixel_size, y * pixel_size, pixel_size, pixel_size), pixels[x][y])
