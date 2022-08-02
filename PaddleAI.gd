extends KinematicBody2D

export (int) var speed = 600
var ball = null
var velocity = Vector2.ZERO

# consider custom signal

func _ready():
	pass

func _physics_process(delta):
	velocity = Vector2.ZERO
	if (ball):
		velocity = position.direction_to(ball.position) * speed
		velocity.x = 0
	velocity = move_and_slide(velocity)
	pass


func _on_Area2D_body_entered(body:Node):
	ball = body
	# # if ball detected, move towards ball's position
	# if (body.name.match("**Ball***")):
	# 	if (body.position.y < self.position.y):
	# 		linear_velocity.y = -speed
	# 	if (body.position.y > self.position.y):
	# 		linear_velocity.y = speed


func _on_Area2D_body_exited(body:Node):
	ball = null
