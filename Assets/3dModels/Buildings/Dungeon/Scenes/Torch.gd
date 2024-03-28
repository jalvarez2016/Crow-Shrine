extends Node3D
var is_on_fire : bool = false
@export var flame : Node3D

func burn(body):
	turn_on_flame()


func turn_on_flame():
	flame.visible = true
	is_on_fire = true


func turn_off_flame():
	flame.visible = false
	is_on_fire = false
