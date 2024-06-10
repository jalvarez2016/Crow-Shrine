extends Node3D

var is_on : bool = false

func _process(delta):
	if is_on:
		rotate_z(PI/90 * 3.5)
