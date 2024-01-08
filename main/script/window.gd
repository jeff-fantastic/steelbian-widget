# window.gd
class_name WM_Window extends Control

'''
Manages Window
'''

@export_category("WM_Window")
## The name of the window
@export var wm_name : String = "WINDOW"

## Whether or not window is following mouse
var following_mouse : bool = false
## The starting position of the window drag
var drag_spos : Vector2 = Vector2.ZERO

func _process(delta : float) -> void:
	if following_mouse:
		global_position = global_position + get_global_mouse_position() - drag_spos

# FUNCTION
#-------------------------------------------------------------------------------

# Ran when close is requested
func close_requested() -> void:
	# Remove self
	queue_free()

func _titlebar_dragged(event : InputEvent) -> void:
	# Check for mouse movement
	if event is InputEventMouseMotion:
		# Check if mouse is held down
		if event.button_mask != MOUSE_BUTTON_MASK_LEFT:
			return
		
		# Start moving window
		global_position += event.relative
