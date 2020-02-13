extends AnimationPlayer

var notified_player: bool = false

func reset():
	get_tree().reload_current_scene()

func _process(delta):
	if GameState.time_left <= 0.0:
		play("died")
	
	for n in get_tree().get_nodes_in_group("activatable"):
		if not n.activated:
			return
	if notified_player:
		return
	notified_player = true
	var text_box = get_node("../UI/TextBox")
	text_box.hide()
	text_box.text_queue = [
		"ALL SYSTEMS OPERATIONAL",
		"OPERATION STATUS: READY FOR LAUNCH"
	]
	GameState.waiting_for = "cockpit"
