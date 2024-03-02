extends Node3D

@export var mouse_sensetivity := 0.005

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion:
		rotation.x -= event.relative.y * mouse_sensetivity
		rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(50))
		
		rotation.y -= event.relative.x * mouse_sensetivity
		rotation.y = wrapf(rotation.y, -PI, PI)
