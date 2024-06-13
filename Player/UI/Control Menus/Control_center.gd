extends Control
class_name MenuManager

@export var menu : CanvasLayer

var isActive : bool = false

func _process(delta):
	if Input.is_action_just_pressed("bag"):
		menu.visible = !menu.visible
		isActive = menu.visible
		if menu.visible:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
