extends Node2D

@export var amount : int
@export var selector : Magic_Selector
var fireball = preload("res://Player/UI/Magic Selector/SpellTypes/3D_Spell_Effects/Fireball/FireBall.tscn")

func cast():
	var root = get_tree().get_root().get_node("World")
	var fireball_instance = fireball.instantiate()
	fireball_instance.position = selector.spell_spawn_position.global_position
	var camera = selector.camera
	fireball_instance.rotation.y = camera.rotation.y
	root.add_child(fireball_instance)
