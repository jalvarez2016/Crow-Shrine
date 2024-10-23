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
@export var mesh_manager : Node3D
@export var animator : AnimationPlayer
@export var comboTimer : Timer

var attacks := [
	{"animation": "Attack1"},
	{"animation": "Attack2"},
	{"animation": "Attack3"}
];

func attack ():
	comboTimer.start()
	mesh_manager.attacking()
	
	is_attacking = true
	is_animating = true
	damage = weapon.damage + int(randf_range(0, damage_range)) + (combo * 10) 
	
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
	_on_combo_reset_timeout()
	
	
func combo_timer():
	comboTimer.start()
	

func _on_combo_reset_timeout():
	combo = 0
	attack_count = 0
	is_attacking = false
	is_animating = false
	mesh_manager.not_attacking()
