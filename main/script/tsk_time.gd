# tsk_time.gd
extends Label

## Reference to update timer
@onready var timer_update : Timer = $update

## Whether or not to populate colon
var add_colon : bool = false

func _ready() -> void:
	_update()

func _update() -> void:
	# Get time from OS
	var dict = Time.get_time_dict_from_system()
	var str = ("%02d:%02d " if add_colon else "%02d %02d ") % [dict.hour, dict.minute]
	add_colon = !add_colon
	
	# Set string
	text = str
