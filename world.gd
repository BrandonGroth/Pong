extends Node2D

@onready var player_score : int = 0:
	get: return player_score
	set(val): player_score = val
	
@onready var ai_score : int = 0:
	get: return ai_score
	set(val): ai_score = val
	
func _ready():
	pass
