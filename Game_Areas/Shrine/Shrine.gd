extends Node3D

@export var spawn_point : Marker3D
var player = preload("res://Player/Player.tscn")
var shrine = preload("res://Shrine.tscn")
var final_area
var fight_areas_amount = 3
@onready var path = [$Shrine]
var fight_areas = [
	"res://Game_Areas/FightAreas/Forest1.tscn",
	"res://Game_Areas/FightAreas/Forest1.tscn",
	"res://Game_Areas/FightAreas/Forest1.tscn",
	"res://Game_Areas/FightAreas/Forest1.tscn",
	"res://Game_Areas/FightAreas/Forest1.tscn",
]
var current_area

func _ready():
	var area_count = 0
	while area_count < fight_areas_amount:
		var rand_number = randi_range(0, fight_areas.size() - 1)
		var fight_area = fight_areas[rand_number]
		fight_area = load(fight_area)
		fight_area = fight_area.instantiate()
		path.push_back(fight_area)
		
		area_count += 1
		
	var count = 1
	while count < path.size():
		var fight_area = path[count]
		if count == 1:
			fight_area.set_next_area(path[count + 1])
		elif count < path.size() - 1 && count > 1:
			fight_area.set_next_area(path[count + 1])
			fight_area.set_previous_area(path[count - 1])
		elif count == path.size() - 1:
			fight_area.set_previous_area(path[count - 1])
		count += 1
	
	player = player.instantiate()
	current_area = path[0]
	current_area.ready_player(player)
	add_child(current_area)


