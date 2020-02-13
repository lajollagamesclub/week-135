extends Sprite

export var activatable: bool = true

func _ready():
	if activatable:
		add_to_group("activatable")

var destroyed: bool = false setget set_destroyed
var activated: bool = false setget set_activated

func set_destroyed(new_destroyed):
	destroyed = new_destroyed
	if has_node("Destroyed"):
		if destroyed:
			$Destroyed.visible = true
			self_modulate = Color(0, 0, 0, 0)
		else:
			$Destroyed.visible = false
			self_modulate = Color(1, 1, 1, 1)

func set_activated(new_activated):
	activated = new_activated
	if activated:
		texture = preload("res://activated-decorations-and-gibs.png")
	else:
		texture = preload("res://decorations-and-gibs.png")
