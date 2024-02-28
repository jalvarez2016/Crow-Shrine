extends Area3D
class_name Weapon

@export var weapon_name : String
@export var damage : int
@export var attackManager : AttackManager

func get_damage():
	return attackManager.get_damage()
