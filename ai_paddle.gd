extends CharacterBody2D

@export var PADDLE_SPEED = 200
@export var PADDLE_FRICTION : int = 400

@onready var ball = $"../../Ball/ball"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Get direction ball is to correct for it
	var direction : float = 0.0
	
	if ball != null:
		direction = ball.global_position.y - global_position.y
	
	if abs(direction) > 0:
		move_paddle(direction)
		
	move_and_collide(velocity*delta)

func move_paddle(direction_y : float):
	global_position += Vector2(0.0,direction_y)
