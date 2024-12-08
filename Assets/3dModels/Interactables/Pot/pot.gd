extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func break_obj(area: Area3D) -> void:
	if area.is_in_group('Weapon'):
		var is_attacking = area.attackManager.is_attacking
		if(is_attacking):
			# vfx dust cloud
			queue_free()
	pass # Replace with function body.
