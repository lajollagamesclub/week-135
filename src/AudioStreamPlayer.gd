extends AudioStreamPlayer

var switched: bool = false

func _process(delta):
	if GameState.destroyed:
		if not switched:
			stream = preload("res://space_ambiance_1.ogg")
			playing = true
			switched = true
