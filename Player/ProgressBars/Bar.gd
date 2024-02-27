extends ProgressBar

@export var need_name : String
@onready var text : Label = get_node("Label")

func update_value (new_value, max):
	max_value = max
	value = new_value
	
	text.text = str(need_name,  ": ", int(value), "/", int(max_value))
