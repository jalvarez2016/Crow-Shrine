extends Node3D


@export var dialogue : Resource
@export var interact_icon : TextureRect
var player : Player
var can_read : bool = false
var is_reading: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.timeline_ended.connect(toggle_read)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_read && Input.is_action_just_pressed("interact") && !is_reading:
		toggle_read()
	pass


func _on_area_entered(area):
	if area.is_in_group("Player"):
		can_read = true
		interact_icon.visible = true
		player = area.player_manager


func _on_area_exited(area):
	if area.is_in_group("Player"):
		can_read = false
		interact_icon.visible = false
		player = null

func toggle_read():
	if can_read:
		interact_icon.visible = !interact_icon.visible
		is_reading = !is_reading
		if is_reading && Dialogic.current_timeline == null:
			Dialogic.start(dialogue)
		player.toggle_UI()
