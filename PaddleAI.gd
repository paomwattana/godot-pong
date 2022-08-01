extends RigidBody2D

export (int) var speed = 600

# consider custom signal

func _ready():
	pass

func _physics_process(delta):
	pass

func _on_Area2D_body_entered(body:Node):
	# if ball detected, move towards ball's position
	if (body.name.match("**Ball***")):
		if (body.position.y < self.position.y):
			linear_velocity.y = -speed
		if (body.position.y > self.position.y):
			linear_velocity.y = speed


func _on_Area2D_body_exited(body:Node):
	pass
	# mode = MODE_STATIC
