extends Area3D


func _on_area_entered(area):
	if area.is_in_group("Player"):
		area.collect_magic_drop()
		queue_free()
