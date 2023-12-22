extends CharacterBody2D

# Speed for paddle to correct movement
@export var PADDLE_SPEED : int = 30

# For paddle reset
@onready var START_POSITION : Vector2 = global_position

# Process Up/Down input and move player paddle to collide
func _process(delta):
	var direction_y : float = Input.get_axis("move_up", "move_down")
	velocity = Vector2(0.0, direction_y) * PADDLE_SPEED
	move_and_collide(velocity*delta)

# Reset paddle position and velocity on game score
func reset() -> void:
	global_position = START_POSITION
	velocity = Vector2.ZERO
