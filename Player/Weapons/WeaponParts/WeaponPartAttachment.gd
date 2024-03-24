extends Area3D

var has_weapon_part: bool = false
var weapon_part : Node3D

@export var player: Player

func _process(_delta):
	if Input.is_action_just_pressed("unequiped") && has_weapon_part:
		remove_weapon_part()

func set_weapon_part(part: Node3D):
	weapon_part = part
	has_weapon_part = true

func attach_weapon_part(area: Area3D):
	if area.is_in_group("Weapon Part") && !has_weapon_part:
		area.attach_weapon_part(self)


func remove_weapon_part():
	print('unequipt')
	weapon_part.eject()
	weapon_part = null
	has_weapon_part = false
