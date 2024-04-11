extends RigidBody3D
var original_position : Vector3

var direction_vector =  {
	'top': Vector3(0, 0, 1),
	'topLeft': Vector3(-1, 0, 1),
	'topRight': Vector3(1, 0, 1),
	'left': Vector3.LEFT,
	'right': Vector3.RIGHT,
	'bottom': Vector3(0, 0, -1),
	'bottomLeft': Vector3(-1, 0, -1),
	'bottomRight': Vector3(1, 0, -1),
}

func _ready():
	original_position = global_position
	

func move(direction):
	print('robot moved in this direction: ', direction)
	var move_direction = direction_vector[direction].rotated(Vector3.UP, rotation.y).normalized() 
	apply_central_impulse(move_direction * 20)
	pass

func reset():
	global_position = original_position
	print('robot reset')
