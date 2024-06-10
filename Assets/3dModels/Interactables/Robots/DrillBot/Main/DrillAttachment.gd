extends Node3D

var is_on : bool = false

func _process(_delta):
	if is_on:
		rotate_z(PI/90 * 3.5)


func _on_drill_area_entered(area):
	if area.is_in_group("breakable"):
		area.get_parent().destroy()
		print("hit breakable object with drill")


func _on_drill_area_exited(area):
	if area.is_in_group("breakable"):
		print("left breakable area")
