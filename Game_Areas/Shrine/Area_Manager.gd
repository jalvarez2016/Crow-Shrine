extends Node3D

@onready var path = ["res://Shrine.tscn"]
var area_is_loading = false
var player = preload("res://Player/Player.tscn")
var shrine = preload("res://Shrine.tscn")
var fight_areas_amount = 3
var fight_areas = [
	"res://Game_Areas/FightAreas/ForestArea1/Forest1.tscn",
	"res://Game_Areas/FightAreas/ForestArea2/Forest2.tscn",
	"res://Game_Areas/FightAreas/ForestArea3/Forest3.tscn",
	"res://Game_Areas/FightAreas/ForestArea4/Forest4.tscn",
]
var final_area
var current_area = 0 # index of the path

func _ready():
	var area_count = 0
	while area_count < fight_areas_amount:
		var rand_number = randi_range(0, fight_areas.size() - 1)
		var fight_area = fight_areas[rand_number]
		path.push_back(fight_area)
		
		area_count += 1
	# Add boss area to the end of path (when it's done)
		
	var shrine_ref = path[0]
	var shrine_instance = load(shrine_ref).instantiate()
	add_child(shrine_instance)
	
	player = player.instantiate()
	add_child(player)
	shrine_instance.ready_player(player)


func _process(_delta):
	if area_is_loading:
		var children_count = get_child_count()
		if children_count == 1:
			area_is_loading = false


#Past jason here
#Make a new scene with a button that activates thw exit or entrance on Q pressed when close enough to it
