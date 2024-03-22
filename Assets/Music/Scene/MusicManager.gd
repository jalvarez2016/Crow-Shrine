extends Node3D
@export var town_music : Music_Provider
@export var fight_area : Music_Provider
@export var game_over : Music_Provider
@export var intro : Music_Provider
@export var victory : Music_Provider

var current_track : AudioStreamPlayer

func play_town_music():
	if current_track != null:
		current_track.stop()
	current_track = town_music._play_random_track()


func play_fight_music():
	if current_track != null:
		current_track.stop()
	current_track = fight_area._play_random_track()


func play_game_over():
	if current_track != null:
		current_track.stop()
	current_track = game_over._play_random_track()


func play_intro_music():
	if current_track != null:
		current_track.stop()
	current_track = intro._play_random_track()


func play_victory_music():
	if current_track != null:
		current_track.stop()
	current_track = victory._play_random_track()
