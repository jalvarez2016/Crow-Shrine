extends Area3D


func _on_area_entered(area):
	if area.is_in_group("Player"):
		print('player')
		area.collect_magic_drop()
		var owner = get_parent()
		owner.queue_free()
