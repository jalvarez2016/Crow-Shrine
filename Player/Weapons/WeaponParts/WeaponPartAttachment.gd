extends Area3D

var has_weapon_part: bool = false
var weapon_part : Node3D
var near_part : bool = false
var part: Area3D

@export var player: Player

func _process(_delta):
	if Input.is_action_just_pressed("unequiped") && has_weapon_part:
		remove_weapon_part()
	if Input.is_action_just_pressed('interact') && !has_weapon_part && near_part:
		attach_weapon_part()

func set_weapon_part(part: Node3D):
	weapon_part = part
	has_weapon_part = true


func _detect_part(area: Area3D):
	if area.is_in_group("Weapon Part"):
		part = area
		near_part = true
		area.toggle_interactable()


func _undetect_part(area: Area3D):
	if area.is_in_group("Weapon Part"):
		part = null
		near_part = false
		area.toggle_interactable()


func attach_weapon_part():
	part.attach_weapon_part(self)


func remove_weapon_part():
	weapon_part.eject()
	weapon_part = null
	has_weapon_part = false
