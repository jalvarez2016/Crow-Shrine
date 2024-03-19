extends Node3D
@export var value = 10

func _on_body_entered(body):
	if body is Player:
		body.collect_treasure(value)
		queue_free()
