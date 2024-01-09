# terminal.gd
class_name Terminal extends Panel

'''
Terminal simulator
'''

## Reference to scroller
@onready var scroll := $margin/scroll
## Reference to sorter
@onready var sort := $margin/scroll/sort
## Reference to user input
@onready var input := $margin/scroll/sort/prompt/input
## Reference to user prefix
@onready var prefix := $margin/scroll/sort/prompt/user
## Reference to relay
@onready var relay := $margin/scroll/sort/relay

# FUNCTION
#-------------------------------------------------------------------------------

func command_sent(string : String) -> void:
	# Push current to relay
	var new_string = "\n" + color_string(prefix.text, Color.GREEN) + string
	relay.text += new_string
	
	# Erase input
	input.text = ""

func command_handler(command : String, args : Array = []) -> void:
	pass

func color_string(string : String, color : Color) -> String:
	return "[color=#" + color.to_html(false) + "]" + string + "[/color]"

func sort_size_changed() -> void:
	# If we're not ready, stop
	if !is_node_ready():
		await ready
	
	# Set scroll
	scroll.set_deferred("scroll_vertical", sort.size.y)
