extends RigidBody3D
@export var player_anchor : Marker3D
var near_machine : bool = false
var player : Player = null

var original_position : Vector3

func _ready():
	original_position = global_position

func _process(delta):
	if near_machine:
		#var input_dir = Input.get_vector("left", "right", "forward", "back")
		#var move_direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		#apply_force(move_direction * 80.0)
		if Input.is_action_just_pressed("interact"):
			toggle_riding_machine()
			
	if player && player.isOnMachine:
		var input_dir = Input.get_vector("left", "right", "forward", "back")
		var move_direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		move_direction = move_direction.rotated(Vector3.UP, player.spring_arm.rotation.y).normalized()
		
		#if move_direction:
			#rotation.y = lerp_angle(rotation.y, atan2(move_direction.x, move_direction.z), delta)
		var test_movement_direction = move_direction * 15.00
		apply_force(test_movement_direction)

func toggle_riding_machine():
	player.toggle_collider()
	if !player.isOnMachine:
		player.global_position = player_anchor.global_position
		player.isOnMachine = true
		player.reparent(player_anchor)
		player.mesh.rotation.y = 0
		$Panel/Label.text = 'Unmount'
	else:
		player.global_position = player_anchor.global_position
		player.mesh.rotation.y = 0
		player.rotation = Vector3.ZERO
		player.isOnMachine = false
		player.reparent(get_tree().get_root().get_children()[1])
		$Panel/Label.text = 'Ride'

	
func toggle_interaction_key():
	$Panel.visible = !$Panel.visible
	near_machine = !near_machine


func _on_ride_area_entered(area):
	if area.is_in_group('Player'):
		player = area.player_manager
		toggle_interaction_key()


func _on_ride_area_exited(area):
	if area.is_in_group('Player'):
		player = null
		toggle_interaction_key()
