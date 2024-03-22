extends Control
var world = preload("res://World.tscn")
var music_manager
var started = false

func _unhandled_input(_enemyevent):
	if !started:
		var game = world.instantiate()
		add_child(game)
		self.visible = false
		started = true

func _ready():
	music_manager = get_tree().get_root().get_node("BackgroundMusic")
	music_manager.play_intro_music()
