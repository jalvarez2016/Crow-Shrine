extends Area3D

var has_weapon_part: bool = false
var weapon_part : Node3D

@export var player: Player

func _process(_delta):
	if Input.is_action_just_pressed("unequiped") && has_weapon_part:
		remove_weapon_part()


func attach_weapon_part(area: Area3D):
	if area.is_in_group("Weapon Part") && !has_weapon_part:
		area.main.reparent(self, true)
		weapon_part = area
		has_weapon_part = true
		weapon_part.main.rotation = player.rotation
		weapon_part.main.global_position = global_position


func remove_weapon_part():
	var root = get_tree().get_root().get_node("Control").get_node("World")
	weapon_part.main.reparent(root, true)
	weapon_part.main.eject()
	weapon_part = null
	has_weapon_part = false
