extends Node2D
class_name Magic_Selector

@export var player : Player
@export var spell_manager : Spell_Manager

func magic():
	spell_manager.cast_spell()
