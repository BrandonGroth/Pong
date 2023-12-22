extends CharacterBody2D

# Audio player for collision sound
@onready var audio_stream_player = $AudioStreamPlayer

# Ball velocity variables
@export var INITIAL_SPEED : int = 50
@export var VELOCITY_PER_PADDLE_COLLISION : float = 1.05
@export var MAX_VELOCITY : float = 400

# Current magnitude of ball
@onready var speed : int = INITIAL_SPEED:
	get: return speed
	set(val): speed = val

# Names of paddles for collision logic
@onready var paddle_names : Array[String] = ["player_paddle", "ai_paddle"]

# For ball reset 
@onready var START_POSITION : Vector2 = global_position

# On creation, move ball in random direction + speed
func _ready():
	set_random_velocity()
	
# Balls only physics is moving and bouncing
func _process(delta):
	collide_and_bounce(velocity * delta)

# Main engine - check for collisions via move_and_collide and compute bounce direction
# If a paddle is hit, the ball will gain a portion of the paddle's velocity
# Also plays collision sound on collision
func collide_and_bounce(acceleration : Vector2) -> void:
	var collision = move_and_collide(acceleration) # acceleration = velocity * delta
	if collision:
		
		# Play collision hit sound
		audio_stream_player.play()
		
		# Increase speed each time a paddle is hit
		if collision.get_collider().name in paddle_names:
			# Add a small percentage of paddle upward/downward velocity to ball
			var paddle_velocity = collision.get_collider().velocity
			velocity += 0.05*paddle_velocity
			
			# Increase speed of ball per paddle collision
			velocity *= VELOCITY_PER_PADDLE_COLLISION
			velocity = velocity.limit_length(MAX_VELOCITY)
		
		# Compute normal bounce motion and resulting velocity
		var motion = collision.get_remainder().bounce(collision.get_normal())
		velocity = velocity.bounce(collision.get_normal())
		move_and_collide(motion) # 2nd collision check required

# Set velocity to random direction for ball start
func set_random_velocity() -> void:
	# Create random (+/- 1, +/-1) normalized vector direction + random variance
	var direction : Vector2 = Vector2.ZERO
	direction.x += (-1 if randf() < .5 else 1) + randf_range(-0.15,0.15)
	direction.y += (-1 if randf() < .5 else 1) + randf_range(-0.15,0.15)
	
	# Normalize direction + set velocity based on speed
	direction = direction.normalized()
	velocity = speed * direction

# Reset position, speed, and set new random velocity
func reset() -> void:
	global_position = START_POSITION
	speed = INITIAL_SPEED
	set_random_velocity()
