extends CharacterBody2D

@export var PADDLE_SPEED : int = 30

@onready var START_POSITION : Vector2 = global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var direction_y : float = Input.get_axis("move_up", "move_down")
	velocity = Vector2(0.0, direction_y) * PADDLE_SPEED
	move_and_collide(velocity*delta)
	
func reset() -> void:
	global_position = START_POSITION
	velocity = Vector2.ZERO
