extends Area2D

signal score

# Only body to enter endzone = ball
func _on_body_entered(_body):
	score.emit()
	#body.queue_free()
