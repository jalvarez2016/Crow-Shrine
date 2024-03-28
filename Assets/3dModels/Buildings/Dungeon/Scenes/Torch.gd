extends Node3D
@export var manager : Node3D
@export var flame : Node3D

func burn():
	turn_on_flame()


func turn_on_flame():
	flame.visible = true
	manager.is_on_fire = true


func turn_off_flame():
	flame.visible = false
	manager.is_on_fire = false
