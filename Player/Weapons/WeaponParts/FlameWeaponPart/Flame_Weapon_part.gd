extends RigidBody3D

@export var damage: float = 5;

# meant for objects that react to fire
func _on_body_entered(body):
	if body.is_in_group("Flamable"):
		body.burn()

# meant for enemies  
func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		area.burn(damage)

func eject():
	global_position = Vector3(global_position.x, global_position.y, global_position.z) + (global_transform.basis.z * 3)

