extends Node3D

@export var player: CharacterBody3D
@export var starting_point: Marker3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.position = starting_point.position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
