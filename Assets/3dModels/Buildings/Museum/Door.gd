extends MeshInstance3D

@export var animator : AnimationPlayer
@export var front_door : Panel
var isOpen : bool = false


func _process(_delta: float) -> void:
	if !isOpen && front_door.visible && Input.is_action_just_pressed("interact"):
		drop_door()

func door_approached(area: Area3D) -> void:
	if area.is_in_group("Player") && !isOpen:
		front_door.visible = true


func door_leave(area: Area3D) -> void:
	if area.is_in_group("Player") && isOpen:
		front_door.visible = false


func drop_door():
	animator.play("DoorDrop")
	isOpen = true
	front_door.visible = false
