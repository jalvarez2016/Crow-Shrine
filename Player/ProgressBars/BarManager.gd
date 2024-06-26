extends Node
class_name BarManager

var value : float
@export var max_value : float
@export var start_value : float
@export var regen_rate : float
@export var decay_rate : float
@export var ui_bar : Node

func _ready():
	value = start_value
	update_ui_bar()

func add(amount: float):
	value += amount
	if value > max_value:
		value = max_value
	update_ui_bar()

func subtract(amount: float = decay_rate):
	if amount > value:
		return false
	value -= amount
	if value < 0:
		value = 0
		
	update_ui_bar()
	return true
		
func update_ui_bar():
	ui_bar.update_value(value, max_value)
