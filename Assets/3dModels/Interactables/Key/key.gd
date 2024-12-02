extends Node3D


func area_entered(area: Area3D) -> void:
#	add to inventory
	queue_free()
