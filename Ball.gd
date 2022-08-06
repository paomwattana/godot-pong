extends Area2D

var rng = RandomNumberGenerator.new()
var velocity = Vector2.ZERO
export var MAX_SPEED = 300

func _ready():
	rng.randomize()
	
	# randomize direction
	velocity.x = rng.randf_range(-1, -0.5)
	velocity.y = rng.randf_range(-1, 1)
	velocity = velocity.normalized() # turn into unit vector
	
	velocity *= MAX_SPEED

func _physics_process(delta):
	# todo: bug where you can vertically push the ball and exert extra force
	# todo: sometimes tilt too
	position.x += velocity.x * delta
	position.y += velocity.y * delta

func _on_Ball_body_entered(body:Node):
	if body.name == "PaddlePlayer" || body.name == "PaddleAI": # PaddlePlayer or PaddleAI
		# to be replaced with proper physics, random for now
		# ooga booga random
		if (velocity.x < 0):
			velocity.x = rng.randf_range(0.5, 1)
		else:
			velocity.x = rng.randf_range(-1, -0.5)
		velocity.y = rng.randf_range(-1, 1)
		velocity = velocity.normalized() # turn into unit vector
		
		velocity *= MAX_SPEED
	else:
		velocity.y = -velocity.y


func _on_GoalRight_area_entered(_body):
	queue_free()

func _on_GoalLeft_area_entered(_body):
	queue_free()
