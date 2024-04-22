extends Control

var pixel_size = 16
var screen_size = DisplayServer.window_get_size()
var canvas_size = Vector2(screen_size.x / pixel_size, screen_size.y / pixel_size)
var pixels = []
var color = Color(0, 0, 1)
var bg_color = Color(255, 255, 255, 1)
var pixellll = 1

func _ready():
	create_canvas()
	
func create_canvas():
	for x in range(canvas_size.x):
		var column = []
		for y in range(canvas_size.y):
			column.append(bg_color)
		pixels.append(column)

func _process(delta):
	draw_or_erase()
	center_positon()

func center_positon():
	position = Vector2(screen_size) / 2 - scale * 8 * canvas_size
	
func draw_or_erase():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		draw_pixel(get_local_mouse_position(), color)
		queue_redraw()
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		erase_pixel(get_local_mouse_position())
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
			draw_rect(Rect2(x * pixel_size , y * pixel_size , pixel_size , pixel_size), pixels[x][y])

func _input(event):
	zoom_with_mouse_wheel(event)
	if event is InputEventKey:
		if event.key_label == KEY_L:
			pixellll += 1
			pixel_size = pixel_size + pixellll
			canvas_size = Vector2(screen_size.x / pixel_size, screen_size.y / pixel_size)
			position = Vector2(screen_size) / 2 - scale * 8 * canvas_size
			
func zoom_with_mouse_wheel(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.is_pressed():
			scale -= Vector2(0.1, 0.1)
			scale = clamp(scale, Vector2(0.1, 0.1), Vector2(1, 1))
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.is_pressed():
			scale += Vector2(0.1, 0.1)
			scale = clamp(scale, Vector2(0.1, 0.1), Vector2(1, 1))

