extends Control
class_name MenuManager

@export var menu : CanvasLayer

@export var inventory_manager : TabBar
@export var armor_manager : TabBar
@export var key_items_manager : TabBar
@export var settigns_manager : TabBar

var isActive : bool = false

func _process(_delta):
	if Input.is_action_just_pressed("bag"):
		menu.visible = !menu.visible
		isActive = menu.visible
		if menu.visible:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func add_to_inventory(item: Dictionary):
	inventory_manager.add_item(item)
