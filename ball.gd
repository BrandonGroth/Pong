extends CharacterBody2D

@export var INITIAL_SPEED : int = 50
@export var VELOCITY_PER_PADDLE_COLLISION : float = 1.05
@export var MAX_VELOCITY : float = 400

@onready var num_paddle_hits : int = 0:
	get: return num_paddle_hits
	set(val): num_paddle_hits = val

@onready var speed : int = INITIAL_SPEED:
	get: return speed
	set(val): speed = val
	
@onready var paddle_names : Array[String] = ["player_paddle", "ai_paddle"]

func _ready():
	# Create random (+/- 1, +/-1) normalized vector direction
	var vector_x = Vector2.LEFT if randf() < .5 else Vector2.RIGHT
	var vector_y = Vector2.UP if randf() < .5 else Vector2.DOWN
	var init_direction = (vector_x + vector_y).normalized()
#	apply_acceleration(init_direction, INIT_ACCELERATION)
	velocity = speed * init_direction
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	collide_and_bounce(velocity * delta)
	
func collide_and_bounce(acceleration : Vector2) -> void:
	var collision = move_and_collide(acceleration) # acceleration = velocity * delta
	if collision:
		print("Ball collided with ", collision.get_collider().name)
		
		# Increase speed each time a paddle is hit
		if collision.get_collider().name in paddle_names:
			# Add a small percentage of paddle upward/downward velocity to ball
			var paddle_velocity = collision.get_collider().velocity
			velocity += 0.05*paddle_velocity
			
			# Increase speed of ball per paddle collision
			velocity *= VELOCITY_PER_PADDLE_COLLISION
			velocity = velocity.limit_length(MAX_VELOCITY)
			#print("Velocity =", velocity)
			
		var motion = collision.get_remainder().bounce(collision.get_normal())
		velocity = velocity.bounce(collision.get_normal())
		move_and_collide(motion)
	
