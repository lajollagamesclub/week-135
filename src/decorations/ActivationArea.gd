extends Area2D

func _ready():
	$CollisionShape2D.shape.extents = get_parent().region_rect.size/2.0


func _on_ActivationArea_body_entered(body):
	if body.is_in_group("player") and get_parent().activatable:
		get_parent().activated = true
