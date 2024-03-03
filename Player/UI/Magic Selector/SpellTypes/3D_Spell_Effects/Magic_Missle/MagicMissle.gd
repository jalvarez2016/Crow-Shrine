extends Node3D

@export var damage: float = 25
@export var speed: float = 0.3

func _process(_delta):
	global_position = Vector3(global_position.x, global_position.y, global_position.z) + (global_transform.basis.z * speed)


func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		# explosion vfx 
		pass
	# dissolve vfx
	queue_free()
