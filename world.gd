extends Node2D

# UI Elements
@onready var ui = $Control/UI
@onready var pause_menu = $PauseMenu

# Endzone elements for scoring
@onready var player_endzone = $Control/Endzones/player_endzone
@onready var ai_endzone = $Control/Endzones/ai_endzone

# Movable characters
@onready var player_paddle = $Control/Paddles/player_paddle
@onready var ai_paddle = $Control/Paddles/ai_paddle
@onready var ball = $Control/Ball/ball

func _ready():
	# Connect endzone scores to be able to reset game
	player_endzone.score.connect(_reset_game)
	ai_endzone.score.connect(_reset_game)
	
	# Connect pause menu button signals
	pause_menu.resume_game.connect(_resume_game)
	pause_menu.quit_game.connect(_quit_game)
	
	# Hide pause menu on start
	pause_menu.hide()

# Process pausing game via Escape - bring up pause menu
func _input(event):
	if event.is_action_pressed("escape_menu"): 
		_pause_game()

# Reset game if score is recorded (ball in endzone)
func _reset_game() -> void:
	wait_timer(1.0) # Wait for timer, then reset game state
	player_paddle.reset()
	ai_paddle.reset()
	ball.reset()

# Simple timer macro
func wait_timer(time : float) -> void:
	await get_tree().create_timer(time).timeout

# Pause game and show pause menu via Escape key
func _pause_game() -> void:
	get_tree().paused = true
	pause_menu.show()

# Resume game and hide pause menu via pause menu Resume button
func _resume_game() -> void:
	get_tree().paused = false
	pause_menu.hide()

# Exit game via pause menu Quit button
func _quit_game() -> void:
	get_tree().quit()
