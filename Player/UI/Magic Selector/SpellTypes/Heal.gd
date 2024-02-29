extends Node2D

@export var amount : int
@export var selector : Magic_Selector


func cast():
	var player = selector.player
	player.healed(amount)

