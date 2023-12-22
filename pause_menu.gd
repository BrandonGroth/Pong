extends ColorRect

signal resume_game
signal quit_game

# Emit signals for resume/quit button presses
# To be connected to world to properly pause/resume game
func _on_resume_button_pressed():
	resume_game.emit()

func _on_quit_button_pressed():
	quit_game.emit()
