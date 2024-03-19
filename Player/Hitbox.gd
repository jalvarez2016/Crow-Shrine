extends Area3D

@export var player_manager : Player
@export var magic_selector: Magic_Selector

func attacked(damage: float):
	player_manager.attacked(damage);
	
func healed(amount: float):
	player_manager.healed(amount);

func collect_magic_drop():
	magic_selector.replenish_magic()

func collect_treasure(body):
	pass
