extends PanelContainer

export var text_queue: Array = []
var shown: bool = false
onready var label = $MarginContainer/Text

func _process(delta):
	if not text_queue.empty():
		if not shown: # just starting playback
			$TextBoxAnimationPlayer.play("show_textbox")
			shown = true
			label.text = text_queue.front()
			label.percent_visible = 0.0

		if label.percent_visible < 1.0:
			label.percent_visible += delta*1.0

func _input(event):
	if event.is_action_pressed("g_next_dialog"):
		if label.percent_visible < 1.0:
			label.percent_visible = 1.0
			return
		else:
			if text_queue.empty() and shown:
				hide()
			next_text()

func hide():
	if not shown:
		return
	$TextBoxAnimationPlayer.play("hide_textbox")
	shown = false

func next_text():
	text_queue.pop_front()
	if text_queue.empty():
		return
	label.text = text_queue.front()
	label.percent_visible = 0.0
