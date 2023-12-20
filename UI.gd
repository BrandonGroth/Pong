extends Control

@onready var player_endzone = $"../Endzones/player_endzone"
@onready var ai_endzone = $"../Endzones/ai_endzone"

@onready var score_ui = $score_ui

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

# Called when the node enters the scene tree for the first time.
func _ready():
	player_endzone.score.connect(_ai_score)
	ai_endzone.score.connect(_player_score)
	display_score()
	
func _player_score() -> void:
	player_score += 1
	
func _ai_score() -> void:
	ai_score += 1
	
func display_score() -> void:
	score_ui.text = str(player_score) + "-" + str(ai_score)
	
func reset_score() -> void:
	player_score = 0
	ai_score = 0
