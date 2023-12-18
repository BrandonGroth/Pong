extends Area2D

# Only body to enter endzone = ball
func _on_body_entered(body):
	body.queue_free()
