extends CharacterBody3D

@onready var root = get_tree().get_root().get_node("test_world")
@onready var navigation_agent = $NavigationAgent3D
var object_class = preload("res://Enemies/racoons/ninja/ninjaStar.tscn")

var player = null
var player_detected : bool
var Speed = 4
var attacking = false
var punch_able = false
var attacks = ["hack", "punch","punch"]
var next_attack = null

var health = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player_detected and attacking == false:
		velocity = Vector3.ZERO
		navigation_agent.set_target_position(player.global_transform.origin)
		var next_navigation_point = navigation_agent.get_next_path_position()
		velocity = (next_navigation_point - global_transform.origin).normalized() * Speed
		look_at(Vector3(player.global_position.x , player.global_position.y, player.global_position.z),Vector3.UP)
		move_and_slide()
	pass

	
func _on_range_area_entered(area):
	if area.is_in_group("Player"):
		player = area
		player_detected = true
		animationPLayer("two_feet_run")
		$Timer.start()
	pass # Replace with function body.

func _on_range_area_exited(area):
	if area.is_in_group("Player"):
		player = null
		player_detected = false
		animationPLayer("standing")
		$Timer.stop()
		
	pass # Replace with function body.
	
	
	
var rng = RandomNumberGenerator.new()

func _on_timer_timeout():
	$Timer.stop()
	var rannum = floor(rng.randf_range(0, 3))
	print(rannum)
	if punch_able == true:
		next_attack = attacks[rannum]
	else:
		next_attack = "hack"
	
	attacking = true
	if next_attack == "hack":
		animationPLayer("haking")
	else:
		animationPLayer("punching")
	print("asjdoijasodj")
	pass # Replace with function body.

func animationPLayer(animation):
	$AnimationPlayer.play(animation)
	$Hacker.animationPLayer(animation)
	pass



func notAttacking():
	$Timer.start(4)
	attacking = false
	animationPLayer("two_feet_run")

func _on_hit_box_area_entered(area):
	if area.is_in_group("Weapon"):
		health -= area.get_damage()
	print(health)
	if health < 0:
		queue_free()
	pass # Replace with function body.


func _on_punchrange_area_entered(area):
	if area.is_in_group("Player"):
		punch_able = true
	pass # Replace with function body.

func _on_punchrange_area_exited(area):
	if area.is_in_group("Player"):
		punch_able = false
	pass # Replace with function body.
