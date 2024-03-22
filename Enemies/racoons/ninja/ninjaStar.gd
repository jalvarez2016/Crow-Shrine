extends RigidBody3D

var speed := 2
@export var damage = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	$shuriken/AnimationPlayer.play("Flying")
	#apply_impulse(global_transform.basis.z * speed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	apply_central_impulse(global_transform.basis.z * speed)


func _on_area_3d_area_entered(area):
	if area.is_in_group("Player"):
		area.attacked(20)
		queue_free()
	pass # Replace with function body.
