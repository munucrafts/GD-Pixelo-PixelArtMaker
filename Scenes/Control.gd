extends Control

var pixel_size = 24
var screen_size = DisplayServer.window_get_size()
var canvas_size = Vector2(screen_size.x / pixel_size, screen_size.y / pixel_size)
var pixels = []
var color = Color(0, 0, 1)
var bg_color = Color(1, 1, 1, 0.75)

func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	for x in range(canvas_size.x):
		var column = []
		for y in range(canvas_size.y):
			column.append(bg_color)
		pixels.append(column)

func _process(delta):
	#set_cursor()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		draw_pixel(get_global_mouse_position(), color)
		queue_redraw()
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		erase_pixel(get_global_mouse_position())
		queue_redraw()

func draw_pixel(position, color):
	var x = int(position.x / pixel_size)
	var y = int(position.y / pixel_size)

	if x >= 0 and x < canvas_size.x and y >= 0 and y < canvas_size.y:
		pixels[x][y] = color

func erase_pixel(position):
	var x = int(position.x / pixel_size)
	var y = int(position.y / pixel_size)

	if x >= 0 and x < canvas_size.x and y >= 0 and y < canvas_size.y:
		pixels[x][y] = bg_color 

func _draw():
	for x in range(canvas_size.x):
		for y in range(canvas_size.y):
			draw_rect(Rect2(x * pixel_size, y * pixel_size, pixel_size, pixel_size), pixels[x][y])

#func set_cursor():
	#var CursorPosition = get_global_mouse_position()
	#$Tex_Cursor.position = CursorPosition
	#$Tex_Cursor.size = Vector2(pixel_size, pixel_size)
