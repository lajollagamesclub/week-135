extends Area2D


func _ready():
	pass


func _on_CockPit_body_entered(body):
	if body.is_in_group("player") and GameState.waiting_for == "cockpit":
		var text_box = get_node("../UI/TextBox")
		text_box.hide()
		text_box.text_queue = [
			"THRUSTER BURN CONFIGURED",
			"CRYO POD READY"
		]
		GameState.waiting_for = "cryo_pod"
	elif body.is_in_group("limbs"):
		get_tree().change_scene("res://EndScreen.tscn")
