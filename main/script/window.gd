# window.gd
class_name WM_Window extends Control

'''
Manages Window
'''

@export_category("WM_Window")
## The name of the window
@export var wm_name : String = "WINDOW"

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
