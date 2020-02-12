extends KinematicBody2D

var accel: Vector2 = Vector2(0.0, 4000)
var vel: Vector2 = Vector2()

func _physics_process(delta):
	var horizontal: float = float(Input.is_action_pressed("g_right")) - float(Input.is_action_pressed("g_left"))
	
	vel += accel*delta
	vel.x = horizontal*400.0
	
	if Input.is_action_just_pressed("g_jump"):
		vel.y = -900.0
	
	vel = move_and_slide(vel, Vector2(0.0, 1.0))
