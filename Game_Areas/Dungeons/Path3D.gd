extends Path3D

@export var path_mesh : Node3D
var off_color = 'ff0000'
var on_color = '00ff00'


func turn_on():
	path_mesh.material.albedo_color = on_color


func turn_off():
	path_mesh.material.albedo_color = off_color
