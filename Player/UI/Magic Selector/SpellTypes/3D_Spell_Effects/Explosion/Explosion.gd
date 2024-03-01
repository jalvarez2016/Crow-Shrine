extends Node3D

@export var damage: float = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Explosion")



func _on_entity_entered(area):
	var canDamage = area.is_in_group("Player") || area.is_in_group("Enemy")
	if canDamage:
		area.attacked(damage)

func done_exploding():
	queue_free()
