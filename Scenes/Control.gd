extends Control

var pixel_size = 8
var pixel_size_multiplier = 3
var screen_size = Vector2(1152, 648)
var canvas_size = Vector2(screen_size.x / pixel_size, screen_size.y / pixel_size)
var pixels = []
var color = Color(0, 0.749, 1)
var bg_color = Color(1, 1, 1, 0)
var opacity = 1

func _ready():
	create_canvas()
	mouse_cursor_visibility(false)
	cursor_color(0.5)
	cursor_shaping()
	center_positon()
	window_size(screen_size)
	
func window_size(size : Vector2):
	DisplayServer.window_set_size(size)
	
func mouse_cursor_visibility(visible : bool):
	if visible:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func create_canvas():
	for x in range(canvas_size.x):
		var column = []
		for y in range(canvas_size.y):
			if x == 0 or x == canvas_size.x - 1 or y == 0 or y == canvas_size.y - 1:
				column.append(Color(0, 0, 0))  # Set extreme pixels to black
			else:
				column.append(bg_color)
		pixels.append(column)
	
func _process(delta):
	draw_or_erase()
	cursor_scaling()
	
func cursor_scaling():
	$"../cursor".scale = pixel_size_multiplier * scale * Vector2(pixel_size, pixel_size) / $"../cursor".size
	
func cursor_color(alpha : float):
	$"../cursor".modulate = color
	$"../cursor".modulate.a = alpha
	
func center_positon():
	var scaledCanvasSize = scale * canvas_size * pixel_size
	scaledCanvasSize.x = scaledCanvasSize.x - 135
	position = abs(Vector2(screen_size) - scaledCanvasSize) / 2
		
func draw_or_erase():
	var cursor_loc_position = get_local_mouse_position()
	var cursor_glob_position = get_global_mouse_position()
	var pos_array = []
	pos_array.append(cursor_loc_position)
	for i in range(pixel_size_multiplier):
		for j in range(pixel_size_multiplier):
			pos_array.append(cursor_loc_position + Vector2(pixel_size * i, pixel_size * j))
	$"../cursor".position = cursor_glob_position.snapped(Vector2(pixel_size, pixel_size))
	if $"../HowTo".visible != true && $"../ExportSettings".visible != true:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			draw_pixel(pos_array, color)
			queue_redraw()
		elif Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			erase_pixel(pos_array)
			queue_redraw()
		
func draw_pixel(positions: Array, color):
	for position in positions:
		var x = int(position.x / pixel_size)
		var y = int(position.y / pixel_size)
		if x > 0 and x < canvas_size.x - 1 and y > 0 and y < canvas_size.y - 1:
			color.a = opacity
			pixels[x][y] = color
			
func erase_pixel(positions: Array):
	for position in positions:
		var x = int(position.x / pixel_size)
		var y = int(position.y / pixel_size)
		if x > 0 and x < canvas_size.x - 1 and y > 0 and y < canvas_size.y - 1:
			pixels[x][y] = bg_color

func _draw():
	for x in range(int(canvas_size.x)):
		for y in range(int(canvas_size.y)):
			draw_rect(Rect2(x * pixel_size, y * pixel_size, pixel_size, pixel_size), pixels[x][y])
	
func _input(event):
	zoom_with_mouse_wheel(event)
			
func zoom_with_mouse_wheel(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.is_pressed():
			scale -= Vector2(0.1, 0.1)
			scale = clamp(scale, Vector2(0.5, 0.5), Vector2(0.8, 0.8))
			center_positon()
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.is_pressed():
			scale += Vector2(0.1, 0.1)
			scale = clamp(scale, Vector2(0.5, 0.5), Vector2(0.8, 0.8))
			center_positon()

func cursor_shaping():
	$"../cursor".texture = load("res://Assets/WhiteBG.jpg")

func export_canvas(filename: String, filepath: String):
	if filename != "" && filepath != "" && DirAccess.dir_exists_absolute(filepath):
		$"../ExportSettings".image_saved()
		$"../cursor".visible = false
		var camera = Camera2D.new()
		add_child(camera)
		scale = Vector2(0.8, 0.8)
		camera.z_index = 10
		camera.anchor_mode = Camera2D.ANCHOR_MODE_FIXED_TOP_LEFT
		camera.enabled = true
		camera.position = Vector2(0.1, 0)
		camera.zoom = Vector2(1/scale.x , 1/scale.y)
		await RenderingServer.frame_post_draw
		var viewport = camera.get_viewport()
		var export_image = viewport.get_texture().get_image()
		await RenderingServer.frame_post_draw
		var save_path
		if filepath.ends_with("\\"):
			save_path = filepath + filename + ".png"
		elif filepath.ends_with(""):
			save_path = filepath + "//" + filename + ".png"
		export_image.save_png(save_path)
		camera.queue_free()
		$"../cursor".visible = true
	else:
		$"../ExportSettings".name_or_path_empty()
