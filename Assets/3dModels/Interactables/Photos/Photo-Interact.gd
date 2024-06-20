extends Node3D

var can_look_at : bool = false
var is_looking_at : bool = false
var player : Player

@export var interact_menu : CanvasLayer
@export var interact_icon : Control
@export var photo_dialogue : Resource


func _ready():
	Dialogic.timeline_ended.connect(toggle_read_photo)


func _on_photo_area_entered(area):
	if area.is_in_group("Player"):
		can_look_at = true
		interact_icon.visible = true


func _on_photo_area_exited(area):
	if area.is_in_group("Player"):
		can_look_at = false
		interact_icon.visible = false


func _process(_delta):
	if can_look_at && Input.is_action_just_pressed("interact") && !is_looking_at:
		toggle_read_photo()


func toggle_read_photo():
	if can_look_at:
		interact_menu.visible = !interact_menu.visible
		is_looking_at = !is_looking_at
		if is_looking_at && Dialogic.current_timeline == null:
			Dialogic.start(photo_dialogue)
