extends Label


func _process(delta):
	visible = GameState.destroyed
	if GameState.destroyed:
		GameState.time_left -= delta
		text = str(stepify(GameState.time_left, 0.01))
