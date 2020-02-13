extends KinematicBody2D

enum STATES {
	top_down
}

var vel: Vector2 = Vector2()
var current_state: int = STATES.top_down

func _physics_process(_delta):
	match current_state:
		STATES.top_down:
			var horizontal: float = float(Input.is_action_pressed("g_right")) - float(Input.is_action_pressed("g_left"))
			var vertical: float = float(Input.is_action_pressed("g_down")) - float(Input.is_action_pressed("g_up"))
			
			if horizontal < 0.0:
				$Sprite.flip_h = true
			elif horizontal > 0.0:
				$Sprite.flip_h = false
			
			var move_speed: float = 400.0
			
			vel = Vector2(horizontal, vertical)*move_speed
			
			vel = move_and_slide(vel)
