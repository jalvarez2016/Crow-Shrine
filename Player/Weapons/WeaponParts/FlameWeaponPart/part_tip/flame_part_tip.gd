extends Node3D

@export var damage: float = 5;
var weapon_part_interactable = preload("res://Player/Weapons/WeaponParts/FlameWeaponPart/flame_weapon_part.tscn")

# meant for objects that react to fire
func _on_body_entered(body):
	if body.is_in_group("Flamable"):
		body.burn()


# meant for enemies  
func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		area.burn(damage)


func eject():
	var weapon_part_interactable_instance = weapon_part_interactable.instantiate()
	var world = get_tree().get_root().get_children()[1]
	world.add_child(weapon_part_interactable_instance)
	weapon_part_interactable_instance.position = Vector3(global_position.x, global_position.y + 1, global_position.z) + (global_transform.basis.z * 2)
	queue_free()
