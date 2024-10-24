extends CharacterBody3D

@onready var root = get_tree().get_root().get_node("test_world")
@onready var shoot_position = $Marker3D
@onready var navigation_agent = $NavigationAgent3D


var object_class = preload("res://Enemies/racoons/ninja/ninjaStar.tscn")
var player = null
var player_detected : bool
var Speed = 4
var attacking = false
var health = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player_detected and attacking == false && health > 0:
		velocity = Vector3.ZERO
		navigation_agent.set_target_position(player.global_transform.origin)
		var next_navigation_point = navigation_agent.get_next_path_position()
		velocity = (next_navigation_point - global_transform.origin).normalized() * Speed
		look_at(Vector3(player.global_position.x , player.global_position.y, player.global_position.z),Vector3.UP)
		
		move_and_slide()
	#navigation_agent.set_target
	
	pass


func ninjaStarAttack():

	var object_instance = object_class.instantiate()
	object_instance.transform = shoot_position.global_transform
	root.add_child(object_instance)
	
func _on_range_area_entered(area):
	if area.is_in_group("Player") && health > 0:
		player = area
		player_detected = true
		$Timer.start(2)
		animationPLayer("two_feet_run")
	pass # Replace with function body.

func _on_range_area_exited(area):
	if area.is_in_group("Player") && health > 0:
		player = null
		player_detected = false
		$Timer.stop()
		animationPLayer("standing")
	pass # Replace with function body.

func _on_timer_timeout():
	animationPLayer("throwing")
	attacking = true
	#ninjaStarAttack()
	pass # Replace with function body.

func animationPLayer(animation):
	$Ninja.animationPLayer(animation)
	$AnimationPlayer.play(animation)
	pass

func notAttacking():
	attacking = false
	animationPLayer("two_feet_run")


func _on_hit_box_area_entered(area):
	if area.is_in_group("Weapon"):
		health -= area.get_damage()
	if health < 0:
		print(health)
		$Timer.stop()
		animationPLayer("Flying")
	pass # Replace with function body.

func ninjaDeath():
	queue_free()
