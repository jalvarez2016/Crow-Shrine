extends Control


@onready var icon_material = $Icon.material


func make_active():
	(icon_material as ShaderMaterial).set_shader_parameter("isActive", true)
	

func deactivate():
	(icon_material as ShaderMaterial).set_shader_parameter("isActive", false)
	
