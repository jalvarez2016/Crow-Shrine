extends Area3D

@export var main: Node3D
@export var interact_key : Panel

func attach_weapon_part(weapon: Node3D):
	var weapon_tip_part = load("res://Player/Weapons/WeaponParts/FlameWeaponPart/part_tip/tip_part.tscn")
	var weapon_tip_part_instance = weapon_tip_part.instantiate()
	weapon.set_weapon_part(weapon_tip_part_instance)
	weapon.add_child(weapon_tip_part_instance)
	main.queue_free()

func toggle_interactable():
	interact_key.visible = !interact_key.visible
