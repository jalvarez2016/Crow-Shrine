extends Node3D
class_name AttackManager

var damage : int = 0 
var attack_count : int = 0
var max_attack_count : int = 2
var combo : int = 0
var is_attacking: bool = false

@export var damage_range: float = 10
@export var weapon :Weapon 
@export var animator : AnimationPlayer
@export var comboTimer : Timer

var attacks := [
	{"animation": "Attack1"},
	{"animation": "Attack2"},
	{"animation": "Attack3"}
];

func attack ():
	is_attacking = true
	
	# choose attack animation based on where you are in the combo
	# attacks do more damage the further you are in a combo
	if animator.is_playing():
		return
	comboTimer.start(1)
	damage = weapon.damage + int(randf_range(0, damage_range)) + (combo * 10) 
	animator.play(attacks[attack_count].animation)
	
	if attack_count < max_attack_count:
		attack_count += 1
	else:
		attack_count = 0
	
	combo += 1


func get_damage():
	if is_attacking:
		print_rich("[color=red][b]Player did this much damage:", damage,"[/b][/color]")
		return damage
	return 0


func _on_combo_reset_timeout():
	combo = 0
	attack_count = 0
	is_attacking = false
