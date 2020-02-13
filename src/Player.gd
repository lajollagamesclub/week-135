extends KinematicBody2D

enum STATES {
	platformer_b4_infected,
	platformer,
	throwing
}

var accel: Vector2 = Vector2(0.0, 4000)
var vel: Vector2 = Vector2()
var current_state: int = STATES.platformer_b4_infected

func _physics_process(delta):
	match current_state:
		STATES.platformer_b4_infected, STATES.platformer:
			var horizontal: float = float(Input.is_action_pressed("g_right")) - float(Input.is_action_pressed("g_left"))
			
			if horizontal < 0:
				$Sprite.flip_h = true
			elif horizontal > 0:
				$Sprite.flip_h = false
			
			# move slower after infection
			var move_velocity: float = 0.0
			if current_state == STATES.platformer_b4_infected:
				move_velocity = 800.0
			else:
				move_velocity = 300.0
	
			vel += accel*delta
			vel.x = horizontal*move_velocity
			
			if Input.is_action_just_pressed("g_jump"):
				vel.y = -900.0
			
			vel = move_and_slide(vel, Vector2(0.0, 1.0))
