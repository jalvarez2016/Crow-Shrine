extends Node3D

@export var button_mesh : MeshInstance3D
var on : bool = false;
var things_on : int = 0
var off_color = 'ff0000'
var on_color = '00ff00'


func turn_on(body):
	if body.is_in_group('heavy'):
		var button_material = button_mesh.get_surface_override_material(1)
		button_material.albedo_color = on_color
		on = true
		things_on += 1


func turn_off(body):
	things_on -= 1
	if body.is_in_group('heavy') && things_on == 0:
		var button_material = button_mesh.get_surface_override_material(1)
		button_material.albedo_color = off_color
		on = false
