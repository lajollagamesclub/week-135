extends CanvasModulate

func _ready():
	visible = true # hide in editor

func break_ship(): # called from animation player, no better place for it
	GameState.destroyed = true
