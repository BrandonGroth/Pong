extends Node2D

@onready var player_endzone = $Control/Endzones/player_endzone
@onready var ai_endzone = $Control/Endzones/ai_endzone
@onready var ui = $Control/UI

@onready var player_paddle = $Control/Paddles/player_paddle
@onready var ai_paddle = $Control/Paddles/ai_paddle
@onready var ball = $Control/Ball/ball

func _ready():
	player_endzone.score.connect(_reset_game)
	ai_endzone.score.connect(_reset_game)
	
func _reset_game() -> void:
	# Wait for timer, then reset game state
	wait_timer(1.0)
	player_paddle.reset()
	ai_paddle.reset()
	ball.reset()
	
	
func wait_timer(time : float) -> void:
	await get_tree().create_timer(time).timeout
	
