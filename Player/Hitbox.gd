extends Area3D

@export var player_manager : Player

func attacked(damage: float):
	player_manager.attacked(damage);
	
func healed(amount: float):
	player_manager.healed(amount);
