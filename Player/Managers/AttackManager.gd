extends Node3D
class_name AttackManager

var attack_count : int = 0
var max_attack_count : int = 1
var combo : int = 0

@export var damage_range: float = 10
@export var weapon :Weapon 
@export var animator : AnimationPlayer

func attack ():
	# choose attack animation based on where you are in the combo
	# attacks do more damage the further you are in a combo
	if attack_count < max_attack_count:
		attack_count += 1
	

func get_damage():
	pass
