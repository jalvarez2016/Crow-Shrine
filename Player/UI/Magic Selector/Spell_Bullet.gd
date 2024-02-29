extends Node2D


@onready var icon_material = $Icon.material
@export var bullet_icon : Sprite2D


func make_active():
	(icon_material as ShaderMaterial).set_shader_parameter("isActive", true)
	

func deactivate():
	(icon_material as ShaderMaterial).set_shader_parameter("isActive", false)
	
