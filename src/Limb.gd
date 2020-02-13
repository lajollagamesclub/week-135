extends KinematicBody2D

var rotation_speed = 0.0
var vel = Vector2()

func _ready():
	randomize()
	rotation_speed = rand_range(-2.0*PI, 2.0*PI)

func _physics_process(delta):
	rotation += rotation_speed*delta
	
	var collision = move_and_collide(Vector2(400.0, 0.0).rotated(rotation)*delta)
	if collision != null:
		rotation += PI/3.0
