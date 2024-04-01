extends Node3D

#Paste the path of the item into the field in the inspector
@export var item : String
@export var spawn_point : Marker3D


func spawn_item():
	var item_instance = load(item).instantiate()
	var world = get_tree().get_root().get_children()[1]
	world.add_child.call_deferred(item_instance)
	item_instance.position = spawn_point.global_position
