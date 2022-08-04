extends Node2D

const ballResource = preload("res://Ball.tscn")
const gameOverMenuResource = preload("res://PaddleAI.tscn")

onready var scorePlayer = 0
onready var scoreAI = 0
onready var ballSpawnTimer = $BallSpawnTimer
export var WINNING_SCORE = 2

func _ready():
	ballSpawnTimer.start()

func checkGameOver():
	if (WINNING_SCORE <= scorePlayer || WINNING_SCORE <= scoreAI):
		var gameOverMenu = gameOverMenuResource.instance()
		if (WINNING_SCORE <= scorePlayer): # player wins
			pass
		else: # AI wins
			pass
		self.call_deferred("add_child", gameOverMenu)

func _on_GoalLeft_area_entered(_body):
	scoreAI += 1
	$Scores/AIScore.text = str(scoreAI)
	checkGameOver()
	ballSpawnTimer.start()

func _on_GoalRight_area_entered(_body):
	scorePlayer += 1
	$Scores/PlayerScore.text = str(scorePlayer)
	checkGameOver()
	ballSpawnTimer.start()


func _on_BallSpawnTimer_timeout():
	var ball = ballResource.instance()
	ball.position.x = 512
	ball.position.y = 300
	
	# allow ball to be deleted after hitting goal
	$GoalLeft.connect("area_entered", ball, "_on_GoalLeft_area_entered")
	$GoalRight.connect("area_entered", ball, "_on_GoalRight_area_entered")
	
	self.call_deferred("add_child", ball)
