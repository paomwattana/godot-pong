extends Node2D

const ballResource = preload("res://Ball.tscn")

onready var scorePlayer = 0
onready var scoreAI = 0
export var WINNING_SCORE = 2

func _ready():
	spawnBall()

func spawnBall():
	var ball = ballResource.instance()
	ball.position.x = 512
	ball.position.y = 300
	
	# allow ball to be deleted after hitting goal
	$GoalLeft.connect("body_entered", ball, "_on_GoalLeft_body_entered")
	$GoalRight.connect("body_entered", ball, "_on_GoalRight_body_entered")
	
	self.add_child(ball)
	
func gameOver():
	pass

func checkGameOver():
	if (WINNING_SCORE <= scorePlayer || WINNING_SCORE <= scoreAI):
		gameOver()

func _on_GoalLeft_body_entered(_body):
	scoreAI += 1
	$Scores/AIScore.text = str(scoreAI)
	checkGameOver()
	spawnBall()

func _on_GoalRight_body_entered(_body):
	scorePlayer += 1
	$Scores/PlayerScore.text = str(scorePlayer)
	checkGameOver()
	spawnBall()
