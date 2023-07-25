extends CharacterBody2D


@export var speed: int = 800

var PlayerVelocity = Vector2()

func get_input():
	PlayerVelocity = Vector2()
	if Input.is_action_pressed("ui_down"):
		PlayerVelocity.y = speed
	if Input.is_action_pressed("ui_up"):
		PlayerVelocity.y = -speed

func _physics_process(delta):
	get_input()
	set_velocity(PlayerVelocity)
	move_and_slide()
	# PlayerVelocity = PlayerVelocity
