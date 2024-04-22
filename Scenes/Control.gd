extends Control

var pixel_size = 16
var screen_size = DisplayServer.window_get_size()
var canvas_size = Vector2(screen_size.x / pixel_size, screen_size.y / pixel_size)
var pixels = []
var color = Color(0, 0, 1)
var bg_color = Color(255, 255, 255, 255)
var cursor_shape = "rectangle"
var opacity = 1

func _ready():
	create_canvas()
	mouse_cursor_visibility(false)
	cursor_color(0.5)
	cursor_shaping()
	
func mouse_cursor_visibility(visible : bool):
	if visible:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func create_canvas():
	for x in range(canvas_size.x):
		var column = []
		for y in range(canvas_size.y):
			column.append(bg_color)
		pixels.append(column)
	
func _process(delta):
	draw_or_erase()
	center_positon()
	cursor_scaling()
	
func cursor_scaling():
	$"../cursor".scale = scale * Vector2(pixel_size, pixel_size) / $"../cursor".size
	
func cursor_color(alpha : float):
	$"../cursor".modulate = color
	$"../cursor".modulate.a = alpha

func center_positon():
	position = Vector2(screen_size) / 2 - scale * ( pixel_size / 2 ) * canvas_size
		
func draw_or_erase():
	var cursor_loc_position = get_local_mouse_position()
	var cursor_glob_position = get_global_mouse_position()
	$"../cursor".position = cursor_glob_position
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		draw_pixel(cursor_loc_position, color)
		queue_redraw()
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		erase_pixel(cursor_loc_position)
		queue_redraw()

func draw_pixel(position, color):
	var x = int(position.x / pixel_size)
	var y = int(position.y / pixel_size)

	if x >= 0 and x < canvas_size.x and y >= 0 and y < canvas_size.y:
		color.a = opacity
		pixels[x][y] = color

func erase_pixel(position):
	var x = int(position.x / pixel_size)
	var y = int(position.y / pixel_size)

	if x >= 0 and x < canvas_size.x and y >= 0 and y < canvas_size.y:
		pixels[x][y] = bg_color 

func _draw():
	for x in range(int(canvas_size.x)):
		for y in range(int(canvas_size.y)):
			if cursor_shape == "circle":
				draw_circle(Vector2(x * pixel_size + pixel_size / 2, y * pixel_size + pixel_size / 2), pixel_size / 2, pixels[x][y])
			elif cursor_shape == "rectangle":
				draw_rect(Rect2(x * pixel_size, y * pixel_size, pixel_size, pixel_size), pixels[x][y])

func _input(event):
	zoom_with_mouse_wheel(event)
			
func zoom_with_mouse_wheel(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.is_pressed():
			scale -= Vector2(0.1, 0.1)
			scale = clamp(scale, Vector2(0.1, 0.1), Vector2(1, 1))
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.is_pressed():
			scale += Vector2(0.1, 0.1)
			scale = clamp(scale, Vector2(0.1, 0.1), Vector2(1, 1))

func cursor_shaping():
	if cursor_shape == "rectangle":
		$"../cursor".texture = load("res://Assets/SquareWhite.jpg")
	elif cursor_shape == "circle":
		$"../cursor".texture = load("res://Assets/CircleWhite.png")


	
