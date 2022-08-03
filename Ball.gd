extends RigidBody2D

var rng = RandomNumberGenerator.new()
export var MAX_SPEED = 300

func _ready():
	rng.randomize()
	
	# randomize direction
	linear_velocity.x = rng.randf_range(-1, 1)
	linear_velocity.y = rng.randf_range(-1, 1)
	linear_velocity = linear_velocity.normalized() # turn into unit vector
	
	linear_velocity *= MAX_SPEED

func _physics_process(delta):
	# todo: bug where you can vertically push the ball and exert extra force
	# todo: sometimes tilt too
	pass


func _on_GoalLeft_body_entered(_body):
	queue_free()

func _on_Ball_body_entered(body:Node):
	if body.name == "PaddlePlayer" || body.name == "PaddleAI": # PaddlePlayer or PaddleAI
		linear_velocity.x = -linear_velocity.x
		linear_velocity.y = rng.randf_range(-1, 1)
		linear_velocity = linear_velocity.normalized() # turn into unit vector
		
		linear_velocity *= MAX_SPEED
	else:
		linear_velocity.y = -linear_velocity.y
