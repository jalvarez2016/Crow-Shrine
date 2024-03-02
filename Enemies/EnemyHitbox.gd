extends Area3D

@export var enemy : CharacterBody3D

@export var burn_manager : BurnManager

func attacked(damage: float):
	enemy.attacked(damage)

func burn(damage: float):
	burn_manager.burn(damage)
