extends Node3D
class_name BurnManager

@export var enemy: CharacterBody3D
@export var damage_timer: Timer
@export var burn_cool_down: Timer


var is_burning: bool = false
var burn_damage: float


func burn(damage: float):
	is_burning = true
	burn_damage = damage
	damage_timer.start()
	burn_cool_down.start()


func _on_damage_timeout():
	if is_burning:
		print('burning')
		enemy.attacked(burn_damage)
		damage_timer.start()


func _on_burn_cool_down_timeout():
	is_burning = false
