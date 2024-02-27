extends Node
class_name TreasureManager

var value : float
@export var max_value : float
@export var start_value : float
@export var loss_value : float
@export var treasure_count : Label

func _ready():
	value = start_value

func add(amount: float):
	value += amount
	if value > max_value:
		value = max_value

func subtract():
	value -= loss_value
	if value < 0:
		value = 0
		
func update_count():
	treasure_count.text = str(value)
