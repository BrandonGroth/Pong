extends CharacterBody2D

@export var PADDLE_SPEED = 200
@export var PADDLE_FRICTION : int = 400

@onready var ball = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = 
	

func apply_acceleration(direction : float, acceleration : float) -> void:
	var move_direction : Vector2 = Vector2(0.0, direction)
	velocity += velocity.move_toward(move_direction, acceleration)
	
func apply_friction(deceleration : float) -> void:
	velocity += velocity.move_toward(Vector2.ZERO, deceleration)
