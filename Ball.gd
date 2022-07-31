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


func _on_GoalLeft_body_entered(body):
	queue_free()


func _on_GoalRight_body_entered(body):
	queue_free()
