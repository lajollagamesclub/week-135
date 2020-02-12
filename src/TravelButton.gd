extends Button

export (String, FILE, "*.tscn") var target_scene_file



func _on_PlayButton_pressed():
	get_tree().change_scene(target_scene_file)
