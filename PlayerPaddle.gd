extends CharacterBody2D

@export var PADDLE_SPEED : int = 200
@export var PADDLE_FRICTION : int = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction : float = Input.get_axis("ui_up", "ui_down")
	
	# If input given, move paddle.  Else slow to zero
	if abs(direction) > 0:
		move_paddle(direction)
		
	move_and_collide(velocity*delta)
	
func move_paddle(direction_y : float):
	global_position += Vector2(0.0,direction_y)
