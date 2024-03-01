extends Node2D
class_name Magic_Selector

@export var player : Player
@export var aim_spell : Node3D
@export var spell_spawn_position : Marker3D
@export var spell_manager : Spell_Manager

func magic():
	spell_manager.cast_spell()
