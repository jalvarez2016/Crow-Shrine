extends TabBar

@export var item_icon: TextureRect
@export var item_description : Label
@export var item_containers: VBoxContainer


func get_next_empty_box():
	pass


func update_description(description: String):
	item_description.text = description
	pass


func remove_item(item_name: String):
	pass


func add_item(item: Dictionary):
	#instantiate a new panel for the new item
	# or a new row wit a new panel if current row is full
	pass


func select_item():
	pass
