extends Label

@onready var score : int:
	get: return score
	set(val): 
		score = val
		text = str(score)
	

