extends Node2D

var menu_buttons = ["Quit", "How to?", "Export", "New"]

func _ready():
	add_menu_buttons()

func add_menu_buttons():
	for menu_button in menu_buttons:
		var btn = load("res://Scenes/MenuButton.tscn").instantiate()
		$HBoxContainer.add_child(btn)
		btn.set_button_name(menu_button)
		var index = menu_buttons.find(menu_button)
		btn.position.x = - index * 100

func _process(delta):
	pass
