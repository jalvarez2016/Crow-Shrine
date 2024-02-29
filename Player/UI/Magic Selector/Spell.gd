extends Label
class_name Spell

@export var spell_name : String

@onready var panel: Panel

func update_spell_ui():
	text = spell_name
