extends Node3D
class_name Music_Provider

var tracks = []

func _ready():
	tracks = get_children()


func _play_random_track():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randi_range(0, tracks.size() - 1)
	var random_track : AudioStreamPlayer = tracks[num]
	random_track.play()
	return random_track
