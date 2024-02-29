extends Area3D

@export var spell_info: Node3D

func get_damage():
	return spell_info.damage

func get_effect():
	return null
