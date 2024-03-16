extends Control
class_name Bullet_Manager

@export var spell_bullets : int = 10
@onready var spell_bullet_icons := [
	$HBoxContainer/Spell_Bullet,
	$HBoxContainer/Spell_Bullet2,
	$HBoxContainer/Spell_Bullet3,
	$HBoxContainer/Spell_Bullet4,
	$HBoxContainer/Spell_Bullet5,
	$HBoxContainer/Spell_Bullet6,
	$HBoxContainer/Spell_Bullet7,
	$HBoxContainer/Spell_Bullet8,
	$HBoxContainer/Spell_Bullet9,
	$HBoxContainer/Spell_Bullet10,
]

func spend():
	if spell_bullets > 0:
		spell_bullet_icons[spell_bullets - 1].deactivate()
		spell_bullets -= 1


func refill():
	if spell_bullets < 10:
		spell_bullets += 1
		spell_bullet_icons[spell_bullets - 1].make_active()
