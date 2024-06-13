extends Node3D

@export var quantity: int = 3
@export var interact_icon : Control

var player : Player
var isNear: bool = false

func _process(_delta):
	if isNear:
		if Input.is_action_just_pressed("interact"):
			run_dialogic()


func _on_area_3d_area_entered(area):
	if area.is_in_group("Player"):
		isNear = true
		interact_icon.visible = true
		player = area.player_manager


func run_dialogic():
	if Dialogic.current_timeline != null:
		return
	Dialogic.start("res://Player/Dialogic/Timelines/Tree_Branches/Tree_Branch_Collected_1.dtl")


func _on_area_3d_area_exited(area):
	if area.is_in_group("Player"):
		isNear = false
		interact_icon.visible = false
		player = null
