extends KinematicBody2D

export (int) var speed = 600
var ball = null
var velocity = Vector2.ZERO



func _physics_process(delta):
	velocity = Vector2.ZERO
	if (ball):
		# move AI paddle towards ball
		velocity = position.direction_to(ball.position) * speed
		velocity.x = 0
	velocity = move_and_slide(velocity)


func _on_DetectionArea2D_area_entered(area):
	ball = area


func _on_DetectionArea2D_area_exited(area):
	ball = null
