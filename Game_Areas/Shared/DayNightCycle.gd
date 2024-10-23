extends Node3D
var time : float
@export var day_length: float = 300.0
@export var start_time: float = 0.5
var time_rate : float

#Sun
var sun : DirectionalLight3D
@export var sun_color : Gradient
@export var sun_intensity : Curve

#Moon
var moon : DirectionalLight3D
@export var moon_color : Gradient
@export var moon_intensity : Curve

#Environment
var environment : WorldEnvironment
@export var sky_top_color : Gradient
@export var sky_horizon_color : Gradient


func _ready():
	time_rate = 1.0 / day_length
	time = start_time
	
	sun = get_node("Sun")
	moon = get_node("Moon")
	environment = get_node("WorldEnvironment")


func _process(delta):
	time += time_rate * delta
	if time >= 1.0:
		time = 0.0
		
	#Sun
	sun.rotation_degrees.x = time * 360 + 180
	sun.light_color = sun_color.sample(time)
	sun.light_energy = sun_intensity.sample(time)
	
	sun.visible = sun.light_energy > 0
	
	#Moon
	moon.rotation_degrees.x = time * 360 
	moon.light_color = moon_color.sample(time)
	moon.light_energy = moon_intensity.sample(time)
	
	moon.visible = moon.light_energy > 0
	
	#Setting the sky color
	environment.environment.sky.sky_material.set("sky_top_color", sky_top_color.sample(time))
	environment.environment.sky.sky_material.set("sky_horizon_color", sky_horizon_color.sample(time))
	environment.environment.sky.sky_material.set("ground_bottom_color", sky_top_color.sample(time))
	environment.environment.sky.sky_material.set("ground_horizon_color", sky_horizon_color.sample(time))
