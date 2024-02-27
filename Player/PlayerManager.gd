extends CharacterBody3D
class_name Player

@export var gravity := 50.0
@export var speed := 8.0
@export var jump_force := 20.0
@export var health := 100
@export var UI_controller : Node3D
@export var roll_cooldwon : Timer

@onready var spring_arm: SpringArm3D = $Head/SpringArm3D
@onready var mesh : MeshInstance3D = $MeshInstance3D
@onready var animation_player : AnimationPlayer = $AnimationPlayer

var angular_acceleration := 7
var isAlive : bool = true
var dodging : bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if !isAlive:
		return
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_force

	if Input.is_action_just_pressed("dodge"): # need to check if stamina is enough
		dodge()

	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var move_direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	move_direction = move_direction.rotated(Vector3.UP, spring_arm.rotation.y).normalized()
	
	
	if move_direction:
		
		# sprinting
		if Input.is_action_pressed("sprint"):
			UI_controller.use_stamina()
			velocity.x = move_direction.x * speed * 1.8
			velocity.z = move_direction.z * speed * 1.8
			
		# dodging
		elif dodging:
			velocity.x = move_direction.x * speed * 3
			velocity.z = move_direction.z * speed * 3
			
		# walking
		else:
			UI_controller.refill_stamina()
			velocity.x = move_direction.x * speed
			velocity.z = move_direction.z * speed
		mesh.rotation.y = lerp_angle(mesh.rotation.y, atan2(move_direction.x, move_direction.z), delta * angular_acceleration)
		
	# standing still
	else:
		UI_controller.refill_stamina()
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	move_and_slide()

func attacked(damage: float):
	UI_controller.damage(damage)

func healed(amount: float):
	UI_controller.heal(amount)

func dodge():
	dodging = true
	roll_cooldwon.start()
	UI_controller.use_stamina(20)
	animation_player.play("Dodge")

func _on_roll_timer_timeout():
	dodging = false
