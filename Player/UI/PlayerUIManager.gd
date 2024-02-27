extends Node3D
class_name UI_Manager

@export var health : BarManager
@export var stamina : BarManager
@export var treasure : TreasureManager


func damage(amount: float):
	health.subtract(amount)
	treasure.subtract() #the amount of money lost per hit is always the same
	
	health.update_ui_bar()
	treasure.update_count()

func heal(amount: float):
	health.add(amount)
	health.update_ui_bar()

func use_stamina(amount: float = 0):
	if amount > 0:
		stamina.subtract(amount)
		stamina.update_ui_bar()
		
	stamina.subtract(.5)
	stamina.update_ui_bar()

func refill_stamina():
	stamina.add(.1)
	stamina.update_ui_bar()
