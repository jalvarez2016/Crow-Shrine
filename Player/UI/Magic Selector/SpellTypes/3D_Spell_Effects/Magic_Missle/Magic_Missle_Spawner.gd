extends Node2D

@export var amount : int
@export var selector : Magic_Selector
var missle = preload("res://Player/UI/Magic Selector/SpellTypes/3D_Spell_Effects/Magic_Missle/magic_missle.tscn")


func cast():
	var root = get_tree().get_root().get_node("World")
	var missle_instance = missle.instantiate()
	missle_instance.position = selector.spell_spawn_position.global_position
	var player = selector.player
	var mesh = player.get_node("MeshInstance3D")
	missle_instance.rotation.y = mesh.rotation.y
	root.add_child(missle_instance)
