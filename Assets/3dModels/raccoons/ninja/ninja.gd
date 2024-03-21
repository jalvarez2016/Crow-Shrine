extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"ninja-star/AnimationPlayer".play("standing")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func animationPLayer(animation_name):
	$ninja/AnimationPlayer.play(animation_name)
	$"ninja-star/AnimationPlayer".play(animation_name)
