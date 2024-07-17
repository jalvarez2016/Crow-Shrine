extends Node2D
class_name TreasureManager

var value : float
@export var max_value : float
@export var start_value : float
@export var loss_value : float
@export var treasure_count : Label

func _ready():
	value = start_value
	update_count()

func add(amount: float):
	value += amount
	if value > max_value:
		value = max_value
	update_count()

func subtract():
	value -= loss_value
	if value < 0:
		value = 0
	update_count()
		
func update_count():
	treasure_count.text = str(value)
