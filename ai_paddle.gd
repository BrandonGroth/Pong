extends CharacterBody2D

@export var PADDLE_SPEED = 40

@onready var ball = $"../../Ball/ball"

@onready var START_POSITION : Vector2 = global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Get direction ball is to correct for it
	var direction : float = 0.0
	if ball != null:
		direction = sign(ball.global_position.y - global_position.y)
	
	velocity = Vector2(0.0, direction) * PADDLE_SPEED
	move_and_collide(velocity*delta)
	
func reset() -> void:
	global_position = START_POSITION
	velocity = Vector2.ZERO
