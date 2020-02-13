extends KinematicBody2D

enum STATES {
	top_down,
	legs_broken
}

var vel: Vector2 = Vector2()
var current_state: int = STATES.top_down
var done_falling: bool = false
var got_limb: bool = false

func trip():
	current_state = STATES.legs_broken


func _physics_process(_delta):
	match current_state:
		STATES.legs_broken:
			if $FallTimer.is_stopped() and not done_falling:
				$FallTimer.start()
				$Sprite.texture = preload("res://dead.png")
				$Sprite.flip_h = true
				$CollisionShape2D.disabled = true
			if not done_falling:
				vel = Vector2(0.0, 200.0)
				vel = move_and_slide(vel)
			if GameState.picked_up_saw:
				if $NewLimbTimer.is_stopped():
					$NewLimbTimer.start()
				if not got_limb:
					$SawingSprite.visible = true
					$Sprite.visible = false
				else:
					$SawingSprite.visible = false
					$Sprite.visible = true
			if got_limb and Input.is_action_just_pressed("g_throw"):
				var cur_limb: Node2D = preload("res://Limb.tscn").instance()
				add_child(cur_limb)
				cur_limb.global_position = global_position
				cur_limb.rotation = global_position.angle_to_point(get_global_mouse_position()) + PI
			
		
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


func _on_FallTimer_timeout():
	done_falling = true


func _on_NewLimbTimer_timeout():
	got_limb = true
