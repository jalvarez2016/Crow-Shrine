extends Node3D
class_name AttackManager

var damage : int = 0 
var attack_count : int = 0
var max_attack_count : int = 2
var combo : int = 0
var is_attacking: bool = false
var is_animating: bool = false

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
	
	print('attacking')
	# choose attack animation based on where you are in the combo
	# attacks do more damage the further you are in a combo
	if animator.is_playing():
		combo_timer()
		return
		
	is_animating = true
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

func stop_animating():
	print('signal')
	is_animating = false
	combo_timer()
	
	
func combo_timer():
	comboTimer.start()
	

func _on_combo_reset_timeout():
	print('not attacking anymore')
	combo = 0
	attack_count = 0
	is_attacking = false
