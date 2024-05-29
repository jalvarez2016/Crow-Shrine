extends RigidBody3D
@export var player_anchor : Marker3D
var near_machine : bool = false
var player : Player = null

var original_position : Vector3

func _ready():
	original_position = global_position

func _process(delta):
	if near_machine:
		if Input.is_action_just_pressed("interact"):
			toggle_riding_machine()
			

func toggle_riding_machine():
	if !player.isOnMachine:
		player.global_position = player_anchor.global_position
		player.rotation.y = -PI/2
		player.isOnMachine = true
		player.reparent(player_anchor)
		$Panel/Label.text = 'Unmount'
	else:
		player.global_position = player_anchor.global_position
		player.rotation.y = 0
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

