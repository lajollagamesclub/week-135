extends Area2D


func _ready():
	pass


func _on_CryoPod_body_entered(body):
	if body.is_in_group("player") and GameState.waiting_for == "cryo_pod":
		get_node("../EventAnimationPlayer").play("cryo_sleep")
		GameState.waiting_for = ""
