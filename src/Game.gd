extends Node2D


func _ready():
	GameState.time_left = 60.0
	GameState.waiting_for = "decorations"
	GameState.destroyed = false
	GameState.picked_up_saw = false
