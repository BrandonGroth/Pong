extends CharacterBody2D

@export var PADDLE_SPEED : int = 200
@export var PADDLE_FRICTION : int = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction : float = Input.get_axis("ui_down", "ui_up")
	
	# If input given, move paddle.  Else slow to zero
	if abs(direction) > 0:
		apply_acceleration(direction, PADDLE_SPEED*delta)
	else:
		apply_friction(PADDLE_FRICTION*delta)
		
	move_and_slide()
	
func apply_acceleration(direction : float, acceleration : float) -> void:
	var move_direction : Vector2 = Vector2(0.0, direction)
	velocity += velocity.move_toward(move_direction, acceleration)
	
func apply_friction(deceleration : float) -> void:
	velocity += velocity.move_toward(Vector2.ZERO, deceleration)

