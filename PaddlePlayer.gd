extends KinematicBody2D


export (int) var speed = 600

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
