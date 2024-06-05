extends CharacterBody3D
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

var original_position : Vector3

func _ready():
	original_position = global_position

func _process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	if near_machine:
		if Input.is_action_just_pressed("interact"):
			toggle_riding_machine()
			
	if player && player.isOnMachine:
		$"../Head".global_position = camera_anchor.global_position
		var input_dir = Input.get_vector("left", "right", "forward", "back")
		var move_direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		move_direction = move_direction.rotated(Vector3.UP, spring_arm.rotation.y).normalized()
		
		if move_direction:
			look_at(global_transform.origin + move_direction, Vector3.UP)
			#if Input.is_action_pressed("left") || Input.is_action_pressed("right"):
				#rotation.y = lerp_angle(rotation.y, atan2(move_direction.x, move_direction.z), delta * .8)
			velocity.x = move_direction.x * speed
			velocity.z = move_direction.z * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.z = move_toward(velocity.z, 0, speed)
		
		move_and_slide()

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
		player.global_position = player_anchor.global_position
		player.mesh.rotation.y = 0
		player.rotation = Vector3.ZERO
		player.isOnMachine = false
		player.reparent(get_tree().get_root().get_children()[1])
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

