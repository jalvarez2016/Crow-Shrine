extends CharacterBody3D


@export var dialogue : Resource
@export var interact_prompt: TextureRect
var can_talk: bool = false
var is_talking: bool = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	Dialogic.timeline_ended.connect(talk)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("interact") && !is_talking:
		talk()

	move_and_slide()


func _on_area_entered(area):
	if area.is_in_group('Player'):
		print('show interact button')
		interact_prompt.visible = true
		can_talk = true


func _on_area_exited(area):
	if area.is_in_group('Player'):
		print('stop showing interact button')
		interact_prompt.visible = false
		can_talk = false


func talk():
	if can_talk:
		interact_prompt.visible = !interact_prompt.visible
		is_talking = !is_talking
		if is_talking && Dialogic.current_timeline == null:
			Dialogic.start(dialogue)
