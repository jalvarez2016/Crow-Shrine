extends Node3D

@export var locked : bool = false
@export var isOpen : bool = false 
@export var interact: TextureRect
var near_door : bool = false

func open():
	rotate_y(PI/2)


func _on_approach_door(body):
	if body is Player && !locked:
		near_door = true
		toggle_interactable()


func _on_leave_door(body):
	if body is Player && !locked:
		near_door = false
		toggle_interactable()


func toggle_interactable():
	interact.visible = !interact.visible


func _process(_delta):
	if Input.is_action_just_pressed('interact') && near_door && !locked:
		open()
