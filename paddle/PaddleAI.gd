extends CharacterBody2D

@export var speed: int = 800
var ball = null
var AiVelocity = Vector2.ZERO



func _physics_process(delta):
	AiVelocity = Vector2.ZERO
	if (ball):
		# move AI paddle towards ball
		AiVelocity = position.direction_to(ball.position) * speed
		AiVelocity.x = 0
	set_velocity(AiVelocity)
	move_and_slide()
	AiVelocity = AiVelocity


func _on_DetectionArea2D_area_entered(area):
	ball = area


func _on_DetectionArea2D_area_exited(area):
	ball = null
