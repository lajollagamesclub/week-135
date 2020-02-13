extends CPUParticles2D

func _process(delta):
	if GameState.destroyed:
		visible = false
		get_node("../FastStars").visible = true
