extends Node3D
class_name Exit

var button_is_pressed = false
@onready var interact_ui : Sprite2D = $KeyboardQ
@onready var exit : Area3D = $Exit
@onready var fence : Node3D = $Exit/fence

func _on_button_body_entered(body: Node3D):
	if body is Player:
		interact_ui.visible = true


func _on_button_body_exited(body):
	if body is Player:
		interact_ui.visible = false


func _process(_delta):
	if Input.is_action_just_pressed("interact") && button_is_pressed == false:
		button_is_pressed = true
		remove_fence()

func remove_fence():
	exit.monitoring = true
	fence.queue_free()


# --- Helper functions for communication with the parent node ---

func get_exit_body():
	return exit

