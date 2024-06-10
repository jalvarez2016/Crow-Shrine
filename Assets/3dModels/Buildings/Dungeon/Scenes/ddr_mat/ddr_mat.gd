extends Node3D

@export var receptor : Node3D


func reset(area):
	if area.is_in_group('Player'):
		receptor.reset()
		print('reset')


func move(area, direction):
	if area.is_in_group('Player'):
		receptor.move(direction)
		print(direction)



func _on_area_3d_area_exited(area):
	receptor.moving = false
	pass # Replace with function body.
