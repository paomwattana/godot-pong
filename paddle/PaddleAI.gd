extends CharacterBody2D

@export var speed: int = 600
var ball = null
var PaddleVelocity = Vector2.ZERO



func _physics_process(delta):
	PaddleVelocity = Vector2.ZERO
	if (ball):
		# moves AI paddle towards the ball
		PaddleVelocity = position.direction_to(ball.position) * speed
		PaddleVelocity.x = 0
	set_velocity(PaddleVelocity)
	move_and_slide()

func _on_DetectionArea2D_area_entered(area):
	ball = area


func _on_DetectionArea2D_area_exited(area):
	ball = null
