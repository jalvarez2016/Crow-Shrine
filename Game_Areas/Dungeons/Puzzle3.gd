extends Node3D

@export var exit_door : Node3D 
@export var torch :Node3D
@export var path: Path3D


func _process(_delta):
	_check_lock()


func _check_lock():
	if torch.is_on_fire && exit_door.locked:
		exit_door.locked = false
		exit_door.open()
		path.turn_on()
