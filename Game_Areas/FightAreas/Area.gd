extends Node3D

var world
var player : Player
var next_area
var prev_area
@export var spawn_point: Marker3D
@export var return_point : Marker3D
@export var entrance : Area3D
@export var exit : Area3D

func ready_player(body: Player):
	player = body
	player.reparent(self)
	player.global_position = spawn_point.position


func ready_returning_player(body: Player):
	player = body
	player.reparent(self)
	player.global_position = return_point.position

func despawn():
	world.area_is_loading = false
	queue_free()


func set_previous_area(area: String):
	prev_area = area


func load_prev_area(body):
	if body is Player && !world.area_is_loading:
		if prev_area == null:
			return
		world.area_is_loading = true
		world.current_area -= 1
		var prev_area_instance = load(prev_area).instantiate()
		prev_area_instance.ready_player(body)
		world.add_child(prev_area_instance)
		despawn.call_deferred()


func set_next_area(area: String):
	next_area = area


func load_next_area(body):
	if body is Player && !world.area_is_loading:
		print('next area loading')
		world.area_is_loading = true
		world.current_area += 1
		var next_area_instance = load(next_area).instantiate()
		next_area_instance.ready_player(body)
		world.add_child(next_area_instance)
		despawn.call_deferred()


func _ready():
	world = get_tree().get_root().get_node("World")
	connect_entrance()
	connect_exit()
	


func connect_entrance():
	if entrance == null:
		return
	
	set_previous_area(world.path[world.current_area - 1])
	entrance.body_entered.connect(load_prev_area)


func connect_exit():
	if exit == null || world.current_area + 1 == world.path.size():
		return
	
	set_next_area(world.path[world.current_area + 1])
	exit.body_entered.connect(load_next_area)
