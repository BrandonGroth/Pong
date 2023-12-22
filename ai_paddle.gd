extends CharacterBody2D

# Needed for moving AI paddle to ball
@onready var ball = $"../../Ball/ball"

# Speed for paddle to correct movement
@export var PADDLE_SPEED = 40

# For paddle reset
@onready var START_POSITION : Vector2 = global_position

# AI paddle follows ball, but is capped by PADDLE_SPEED
func _process(delta):
	# Get direction ball is to correct for it
	var direction : float = 0.0
	if ball != null:
		direction = sign(ball.global_position.y - global_position.y)
	velocity = Vector2(0.0, direction) * PADDLE_SPEED
	move_and_collide(velocity*delta)

# Reset paddle position and velocity on game score
func reset() -> void:
	global_position = START_POSITION
	velocity = Vector2.ZERO
