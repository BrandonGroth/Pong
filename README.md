This project is part of the 20 Games Challenge: https://20_games_challenge.gitlab.io/.

I programmed Pong in Godot 4.1.2 Stable, although I believe it should be portable to any 4.x versions.  

The project is organized as follows:
* World - The root Node2D node of the project and contains logic for managing the UI + pausing
* Control - A Control node that sets the viewport to the device's screen size
* Endzones - Area2D nodes to watch for entering bodies (ie the ball) and emit signal for scoring
* Boundaries - StaticBody2D nodes as the physical barriers to the top and bottom of the field
* Paddles - CharacterBody2D nodes for the player and AI paddles to reflect the ball via move_and_collide()
* Ball - CharacterBody2D node for ball to move, bounce, and collide.  The ball plays a sound on collision.
* UI - Label node to add a score for the player and AI
* PauseMenu - Nest of various control nodes to add 2x buttons that resume or quit the game upon hitting Escape.

For the PauseMenu, I followed this tutorial: https://www.youtube.com/watch?v=9dlNkB-QK3c, but had to modify it because the viewport was small.

Game Design Notes:

The AI paddle is capable of moving faster than the player paddle.  This is because the player can antipate where the ball will go, whereas the AI paddle simply follows the balls position.
The ball gets added speed every paddle hit up to a maximum velocity, and also adds a small portion of the paddle's velocity from being "pushed".
At a certain point, the AI will no longer be able to keep up with ball if the player manages to predict the ball's path.  However, the ball is moving so quickly that the player will struggle as well.  
Most scores occur within 10 paddle hits or less.

Project Settings:
* Custom inputs for move_up, move_down, and escape_menu (ie pause)
* Viewport: 100x50 as the pixel art is very basic.  Stretch mode is set to viewport + expand to allow dynamically changing with the device screen size via the Control node.

Assets:
* Ball.png = 2x2
* Paddle.png = 2x8
* Wall.png = 100x2
* Divider.png = 1x8 (not used)
* Hit_3.wav = sound for ball collision 

The sprites were made in Pixelorama.  I did not like how the game gets scaled up to higher resolutions as it becomes grainy from being tiny and low pixel density, but I don't know of a better solution at this point in time.
The sound effect was from the "Classic Arade Sound Effects" free sound effects pack on itch.io (path = Classic Arcade SFX/Hit/Hit_3.wav ; link: https://yourpalrob.itch.io/classic-arcade-sound-effects).
