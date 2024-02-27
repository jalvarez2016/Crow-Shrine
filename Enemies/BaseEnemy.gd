extends CharacterBody3D

@export var health: float
@export var strength: float

const movement_speed = 5.0
const JUMP_VELOCITY = 4.5

var player : CharacterBody3D
var player_detected : bool
var player_is_in_striking_distance : bool
@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D
@onready var animation_player : AnimationPlayer = $AnimationPlayer

func _ready():
	navigation_agent.path_desired_distance = 0.5
	navigation_agent.target_desired_distance = 0.5
	animation_player.play("RESET")

func set_movement_target(movement_target: Vector3):
	navigation_agent.set_target_position(movement_target)

func _physics_process(delta):
	#detects player and sets the movement target to player if detected
	player_detection(delta)
	
	if navigation_agent.is_navigation_finished():
		if player_detected:
			print(player_detected)
			set_movement_target(player.global_position)
			return
		return
	var current_agent_position: Vector3 = global_position
	var next_path_position: Vector3 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	move_and_slide()

func player_detection(delta):
	var detection_rays = [
		get_node("PlayerDetection/RayCast3D"),
		get_node("PlayerDetection/RayCast3D2"),
		get_node("PlayerDetection/RayCast3D3"),
		get_node("PlayerDetection/RayCast3D4"),
		get_node("PlayerDetection/RayCast3D5"),
	];
	
	var index = 0
	while index < detection_rays.size():
		var ray = detection_rays[index]
		if ray.is_colliding() && !player_detected:
			var collision_body = ray.get_collider() 
			if collision_body.is_in_group("Player"):
				var direction = global_position - collision_body.position
				rotation.y = (lerp_angle(rotation.y, atan2(direction.x, direction.z), delta * 7))
				
				player = collision_body
				player_detected = true
				set_movement_target(player.global_position)
				return
		index += 1
	
	player = null
	player_detected = false

func _on_hit_player(body):
	if body is Player && player_is_in_striking_distance:
		print('hit player')
		body.attacked(strength)


func _on_striking_area_entered(body):
	if body is Player:
		player_is_in_striking_distance = true
		animation_player.play("Attack");

func _on_striking_area_exited(body):
	if body is Player:
		player_is_in_striking_distance = false
		animation_player.play("RESET")
