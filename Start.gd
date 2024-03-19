extends Control
var world = preload("res://World.tscn")
var started = false

func _unhandled_input(_event):
	if !started:
		var game = world.instantiate()
		add_child(game)
		self.visible = false
		started = true
