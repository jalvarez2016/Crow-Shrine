extends Node3D

@export var flame_part_spawner : Node3D
@export var exit_door : Node3D 
@export var button :Node3D
@export var path: Path3D

func _ready():
	flame_part_spawner.spawn_item()


func _process(_delta):
	_check_lock()


func _check_lock():
	if button.on && exit_door.locked:
		exit_door.locked = false
		exit_door.open()
		path.turn_on()
	
	if !button.on:
		exit_door.locked = true
		exit_door.close()
		path.turn_off()
