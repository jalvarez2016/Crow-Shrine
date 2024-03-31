extends RigidBody3D

@export var damage: float = 25
@export var speed: float = 100
var explosion = preload("res://Player/UI/Magic Selector/SpellTypes/3D_Spell_Effects/Explosion/Explosion.tscn")


func _ready():
	$Explode.start()

func _process(_delta):
	apply_central_force(Vector3(global_transform.basis.z * speed))


func _on_area_entered(_area):
	explode()
	queue_free()


func _on_explode_timeout():
	explode()
	queue_free()

func explode():
	var root = get_tree().get_root().get_children()[1]
	var explosion_instance = explosion.instantiate()
	explosion_instance.position = global_position
	root.add_child(explosion_instance)
