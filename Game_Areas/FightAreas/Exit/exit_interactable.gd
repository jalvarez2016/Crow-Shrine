extends Node3D
class_name Exit

var button_is_pressed = false
var near_button = false
@onready var interact_ui : Sprite2D = $KeyboardQ
@onready var exit : Area3D = $Exit
@onready var fence : Node3D = $Exit/fence

func _on_button_body_entered(body: Node3D):
	if body is Player:
		interact_ui.visible = true
		near_button = true


func _on_button_body_exited(body):
	if body is Player:
		interact_ui.visible = false
		near_button = false


func _process(_delta):
	if Input.is_action_just_pressed("interact") && button_is_pressed == false && near_button:
		button_is_pressed = true
		remove_fence()

func remove_fence():
	exit.monitoring = true
	fence.queue_free()


# --- Helper functions for communication with the parent node ---

func get_exit_body():
	return exit

