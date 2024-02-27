extends Node3D
class_name UI_Manager

@export var health : BarManager
@export var stamina : BarManager
@export var treasure : TreasureManager


func damage(amount: float):
	health.subtract(amount)
	treasure.subtract() #the amount of money lost per hit is always the same

func heal(amount: float):
	health.add(amount)

func use_stamina(amount: float = 0):
	if amount > 0:
		return stamina.subtract(amount)
	else:
		stamina.subtract(.5)

func refill_stamina():
	stamina.add(.2)
	
