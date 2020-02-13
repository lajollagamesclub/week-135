extends StaticBody2D


func _process(delta):
	if GameState.destroyed:
		$Sprite.visible = false
		$BrokenSprite.visible = true
