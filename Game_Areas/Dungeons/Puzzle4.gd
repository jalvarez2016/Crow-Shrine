extends Node3D

@export var exit_door : Node3D 
@export var button :Node3D
@export var path: Path3D

@export var fences : Node3D
@export var fence_torch : Node3D
@export var fence_path : Path3D


func _process(_delta):
	_check_lock()
	_check_fence()


func _check_lock():
	if button.on && exit_door.locked:
		exit_door.locked = false
		exit_door.open()
		path.turn_on()
		
	if !button.on:
		exit_door.locked = true
		exit_door.close()
		path.turn_off()


func _check_fence():
	if fences != null && fence_torch.is_on_fire:
		fences.queue_free()
		fence_path.turn_on()
