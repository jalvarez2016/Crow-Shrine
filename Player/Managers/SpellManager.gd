extends Node
class_name Spell_Manager

var selected_spell : int = 2
var changing_spell : bool = false

@export var spell_bullet_manager: Bullet_Manager

@export var spell1 : Node2D
@export var spell2 : Node2D
@export var spell3 : Node2D
@export var spell4 : Node2D

@export var slot_position1: Marker2D
@export var slot_position2: Marker2D
@export var slot_position3: Marker2D

@onready var spells:= [spell1, spell2, spell3, spell4]


func cast_spell():
	if spell_bullet_manager.spell_bullets  == 0:
		# play a sound effect
		return
	spell_bullet_manager.spend()
	spells[selected_spell].cast()


func _ready():
	show_spells()
	hide_adjacent_spells()


func show_spells():
	var topSpell = spells[selected_spell - 1]
	var current_spell = spells[selected_spell]
	var bottomSpell = spells[selected_spell + 1]
	
	topSpell.global_position = slot_position1.global_position
	current_spell.global_position = slot_position2.global_position
	bottomSpell.global_position = slot_position3.global_position
	
	topSpell.visible = true
	current_spell.visible = true
	bottomSpell.visible = true


func hide_adjacent_spells():
	var topSpell = spells[selected_spell - 1]
	var bottomSpell = spells[selected_spell + 1]
	
	topSpell.visible = false
	bottomSpell.visible = false


func _unhandled_input(event: InputEvent):
	if changing_spell:
		return
		
	if Input.is_action_just_released("select"):
		hide_adjacent_spells()
		
	if Input.is_action_just_pressed("select"):
		show_spells()
	
	if event is InputEventMouseButton && Input.is_action_pressed("select"):
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				# roll wheel up
				changing_spell = true
				$ScrollCoolDown.start()
				_update_spell_order("up")
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				#roll wheel down
				changing_spell = true
				$ScrollCoolDown.start()
				_update_spell_order("down")


func _update_spell_order(movement: String):
	# the direction is inversed
	# need to play test to see if it's too confusing
	if movement == "up":
		var temp = spells[0]
		var new_spell_order = []
		temp.visible = false
		
		var count = 1
		while count < spells.size():
			spells[count].visible = false
			new_spell_order.append(spells[count])
			count += 1
		new_spell_order.append(temp)
		
		spells = new_spell_order
		show_spells()
	elif movement == "down":
		var temp = spells[spells.size() - 1]
		var new_spell_order = [temp]
		temp.visible = false
		
		var count = 0
		while count < spells.size() - 1:
			spells[count].visible = false
			new_spell_order.append(spells[count])
			count += 1
		
		spells = new_spell_order
		show_spells()


func _on_scroll_cool_down_timeout():
	changing_spell = false
