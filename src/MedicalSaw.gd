extends Area2D

var picked_up: bool = false

func _process(delta):
	if picked_up:
		visible = false
		return
	visible = GameState.destroyed


func _on_MedicalSaw_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		picked_up = true
		GameState.picked_up_saw = true
