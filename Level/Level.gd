extends Node

onready var ball: KinematicBody2D = $Ball
onready var playerScoreLabel: Label = $PlayerScore
onready var opponentScoreLabel: Label = $OpponentScore
onready var countdownTimer: Timer = $CountdownTimer
onready var countdownTimeLabel: Label = $CountdownTime
onready var scoreSound: AudioStreamPlayer = $ScoreSound

onready var player: KinematicBody2D = $Player
onready var opponent: KinematicBody2D = $Opponent

const X_POSITION_OFFSET: int = 64

var playerScore: int = 0
var opponentScore: int = 0


func _on_WallLeft_body_entered(body: Node) -> void:
    opponentScore += 1

    reset_game_round()


func _on_WallRight_body_entered(body: Node) -> void:
    playerScore += 1

    reset_game_round()


func reset_game_round() -> void:
    reset_ball_position()
    stop_ball_movement()

    countdownTimer.start()
    countdownTimeLabel.show()

    scoreSound.play()

    reset_player_x_position()
    reset_opponent_x_position()


func reset_ball_position() -> void:
    var resolution = get_viewport().size
    ball.position = Vector2(
        resolution.x / 2,
        resolution.y / 2
    )


func stop_ball_movement() -> void:
    get_tree().call_group("BallGroup", "stop_ball")


func reset_player_x_position() -> void:
     player.position.x = X_POSITION_OFFSET


func reset_opponent_x_position() -> void:
    var resolution = get_viewport().size
    opponent.position.x = resolution.x - X_POSITION_OFFSET


func _process(delta: float) -> void:
    playerScoreLabel.text = str(playerScore)
    opponentScoreLabel.text = str(opponentScore)

    var timeBeforeGameStart = int(countdownTimer.time_left + 1)
    countdownTimeLabel.text = str(timeBeforeGameStart)


func _on_CountdownTimer_timeout() -> void:
    get_tree().call_group("BallGroup", "restart_ball")
    countdownTimeLabel.hide()
