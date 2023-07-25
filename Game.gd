extends Node2D

const ballResource = preload("res://ball/Ball.tscn")
const gameOverMenuResource = preload("res://ui/GameOverMenu.tscn")

@onready var scorePlayer = 0
@onready var scoreAI = 0
@onready var ballSpawnTimer = $BallSpawnTimer
@onready var winLoseLabel = $WinLoseLabel
@export var WINNING_SCORE = 2



func _ready():
	ballSpawnTimer.start()
	winLoseLabel.visible = false

func checkGameOver():
	if (WINNING_SCORE <= scorePlayer || WINNING_SCORE <= scoreAI):
		winLoseLabel.visible = true
		var gameOverMenu = gameOverMenuResource.instantiate()
		if (WINNING_SCORE <= scorePlayer): # player wins
			winLoseLabel.text = "You Won!"
		else: # AI wins
			winLoseLabel.text = "You Lost..."
		self.call_deferred("add_child", gameOverMenu)
	else:
		ballSpawnTimer.start()

func _on_GoalLeft_area_entered(_body):
	scoreAI += 1
	$ScoresUI/AIScore.text = str(scoreAI) # 
	checkGameOver()

func _on_GoalRight_area_entered(_body):
	scorePlayer += 1
	$ScoresUI/PlayerScore.text = str(scorePlayer)
	checkGameOver()


func _on_BallSpawnTimer_timeout():
	var ball = ballResource.instantiate()
	ball.position.x = 512
	ball.position.y = 300
	
	# allow ball to be deleted after hitting goal
	$GoalLeft.connect("area_entered",Callable(ball,"_on_GoalLeft_area_entered"))
	$GoalRight.connect("area_entered",Callable(ball,"_on_GoalRight_area_entered"))
	
	self.call_deferred("add_child", ball)
