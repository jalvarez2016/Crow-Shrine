extends Node3D

@export var player = Player
@onready var animator = $AnimationTree

func update_animation_parameters():
	# Check if player is alive
	if !player.isAlive:
		animator["parameters/conditions/is_defeated"] = true
	
	
	## attacking logic
	## You cannot attack and move at the same time
	if (player.attack_manager.is_animating):
		attacking()
		return
	else:
		not_attacking()
	#
	if (player.velocity == Vector3.ZERO):
		idle()
	else:
		moving()

func attacking():
	animator["parameters/conditions/attacking"] = true
	animator["parameters/conditions/idling"] = false
	animator["parameters/conditions/moving"] = false
	
	
	# Attack State Machine
	animator["parameters/Attack/conditions/attacking"] = true
	animator["parameters/Attack/conditions/not_attacking"] = false
	return
	

func not_attacking():
	animator["parameters/conditions/attacking"] = false
	animator["parameters/conditions/idling"] = true
	
	# Attack State Machine
	animator["parameters/Attack/conditions/attacking"] = false
	animator["parameters/Attack/conditions/not_attacking"] = true
	
	
	
func idle():
	animator["parameters/conditions/idling"] = true
	#animator["parameters/conditions/attacking"] = false
	#animator["parameters/conditions/defending"] = false
	#animator["parameters/conditions/jumping"] = false
	animator["parameters/conditions/moving"] = false
	animator["parameters/Move/conditions/not_moving"] = false
	
	
func moving():
	animator["parameters/conditions/moving"] = true
	animator["parameters/conditions/idling"] = false
	#animator["parameters/Move/conditions/dodging"] = false
	
	if player.dodging:
		animator["parameters/Move/conditions/dodging"] = true
	else:
		animator["parameters/Move/conditions/dodging"] = false
	
	# check if sprinting
	if player.isSprinting:
		animator["parameters/Move/conditions/sprinting"] = true
		animator["parameters/Move/conditions/walking"] = false
	else:
		animator["parameters/Move/conditions/sprinting"] = false
		animator["parameters/Move/conditions/walking"] = true
		
	# check if defending 
	
	
