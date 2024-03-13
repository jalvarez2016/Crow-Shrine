extends Node3D

var player : Player
var next_area : Node3D
var prev_area : Node3D
@export var spawn_point: Marker3D

func ready_player(body: Player):
	player = body
	player.global_position = spawn_point.global_position


func despawn():
	queue_free()


func set_previous_area(area: Node3D):
	prev_area = area


func load_prev_area():
	
	prev_area.ready_player()
	despawn()


func set_next_area(area: Node3D):
	next_area = area


func load_next_area():
	
	next_area.ready_player()
	despawn()
	pass
