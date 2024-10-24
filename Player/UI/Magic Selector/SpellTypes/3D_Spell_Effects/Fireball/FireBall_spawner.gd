extends Node2D

@export var amount : int
@export var selector : Magic_Selector
var fireball = preload("res://Player/UI/Magic Selector/SpellTypes/3D_Spell_Effects/Fireball/FireBall.tscn")

func cast():
	var root = get_tree().get_root().get_children()[1]
	var fireball_instance = fireball.instantiate()
	fireball_instance.position = selector.spell_spawn_position.global_position
	var camera = selector.aim_spell
	fireball_instance.rotation_degrees.y = camera.rotation_degrees.y
	root.add_child(fireball_instance)
