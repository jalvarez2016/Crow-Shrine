extends Area3D

@export var enemy : CharacterBody3D

func attacked(damage: float):
	enemy.attacked(damage)
