extends Control

# Set viewport to be size of device screen
func _ready():
	get_viewport().size = DisplayServer.screen_get_size()

