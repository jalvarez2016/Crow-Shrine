extends VehicleBody3D
@export var gravity := 50.0
@export var speed := 5.0
@export var panel : Panel
@export var label : Label
@export var player_anchor : Marker3D
@export var camera_anchor : Marker3D
@export var spring_arm : SpringArm3D
@export var camera : Camera3D
var near_machine : bool = false
var player : Player = null

const MAX_STEER  = 0.8
const ENGINE_POWER = 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if near_machine:
		if Input.is_action_just_pressed("interact"):
			toggle_riding_machine()
	
	if player && player.isOnMachine:
		$Head.global_position = camera_anchor.global_position
		var input_dir = Input.get_vector("left", "right", "forward", "back")
		var move_direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		move_direction = move_direction.rotated(Vector3.UP, spring_arm.rotation.y).normalized()
		
		steering = move_toward(steering, Input.get_axis("right", "left") * MAX_STEER, delta *2.5)
		engine_force = Input.get_axis("back", "forward") * ENGINE_POWER
		set_engine_force(engine_force)


func toggle_riding_machine():
	player.toggle_collider()
	if !player.isOnMachine:
		camera.make_current()
		player.global_position = player_anchor.global_position
		player.isOnMachine = true
		player.reparent(player_anchor)
		player.mesh.rotation.y = 0
		label.text = 'Unmount'
	else:
		camera.clear_current()
		player.global_position = player_anchor.global_position + Vector3(0, 2, 0)
		player.mesh.rotation.y = 0
		player.isOnMachine = false
		player.reparent(get_tree().get_root().get_children()[1])
		player.rotation = Vector3.ZERO
		print(player.rotation)
		label.text = 'Ride'


func toggle_interaction_key():
	panel.visible = !panel.visible
	near_machine = !near_machine


func _on_ride_area_entered(area):
	if area.is_in_group('Player'):
		player = area.player_manager
		toggle_interaction_key()


func _on_ride_area_exited(area):
	if area.is_in_group('Player'):
		player = null
		toggle_interaction_key()

