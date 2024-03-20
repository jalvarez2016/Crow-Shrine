extends Control
var world = preload("res://World.tscn")
var started = false

func _unhandled_input(_enemyevent):
	if !started:
		var game = world.instantiate()
		add_child(game)
		self.visible = false
		started = true
