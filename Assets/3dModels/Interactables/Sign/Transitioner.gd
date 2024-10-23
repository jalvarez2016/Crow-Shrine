extends Node3D

@export var parent: Node3D

var world
var museum_scene = load("res://Game_Areas/Dungeons/Museum.tscn")

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	world = get_tree().get_root()

func _on_dialogic_signal(argument:String):
	if argument == "museum":
		var museum_instance = museum_scene.instantiate()
		world.add_child(museum_instance)
		parent.queue_free()
