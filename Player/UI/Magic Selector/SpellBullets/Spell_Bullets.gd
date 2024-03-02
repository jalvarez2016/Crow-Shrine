extends Node2D
class_name Bullet_Manager

@export var spell_bullets : int = 10
@onready var spell_bullet_icons := [
	$Spell_Bullet,
	$Spell_Bullet2,
	$Spell_Bullet3,
	$Spell_Bullet4,
	$Spell_Bullet5,
	$Spell_Bullet6,
	$Spell_Bullet7,
	$Spell_Bullet8,
	$Spell_Bullet9,
	$Spell_Bullet10,
]

func spend():
	if spell_bullets > 0:
		spell_bullet_icons[spell_bullets - 1].deactivate()
		spell_bullets -= 1


func refill():
	if spell_bullets < 10:
		spell_bullets += 1
		spell_bullet_icons[spell_bullets - 1].make_active()
