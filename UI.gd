extends Control

# Needed to get signals from endzones
@onready var player_endzone = $"../Endzones/player_endzone"
@onready var ai_endzone = $"../Endzones/ai_endzone"

# 
@onready var score_ui = $score_ui

# Getter/Setters for player/ai scores
# On score change, displayed score will update
@onready var player_score : int = 0:
	get: return player_score
	set(val): 
		player_score = val
		display_score()
	
@onready var ai_score : int = 0:
	get: return ai_score
	set(val):
		ai_score = val
		display_score()

# Connect endzones to corresponding score functions + disply score at start
func _ready():
	player_endzone.score.connect(_ai_score)
	ai_endzone.score.connect(_player_score)
	display_score()

# Update scores from endzone signals ; setter will update display
func _player_score() -> void:
	player_score += 1
	
func _ai_score() -> void:
	ai_score += 1

# Set text of display to be <player_score>-<ai_score>
func display_score() -> void:
	score_ui.text = str(player_score) + "-" + str(ai_score)

# On game reset, set scores to zero
func reset_score() -> void:
	player_score = 0
	ai_score = 0
