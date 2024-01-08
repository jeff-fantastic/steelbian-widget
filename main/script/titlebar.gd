# titlebar.gd
class_name WM_Titlebar extends PanelContainer

'''
Manages Titlebar
'''

## Fired when close button is pressed
signal close_requested()

## Reference to name
@onready var titlebar_name := $sort/window_name
## Reference to close button
@onready var titlebar_close := $sort/window_close

func _ready() -> void:
	# Verify we are child of WM_Window
	assert(owner is WM_Window)
	
	# Get name from owner
	var wm_window = owner as WM_Window
	titlebar_name.text = wm_window.wm_name
