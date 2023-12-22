extends Area2D

signal score

# When endzone entered, emit score
# Only ball can enter enter (paddles are outside boundary)
func _on_body_entered(_body):
	score.emit()
