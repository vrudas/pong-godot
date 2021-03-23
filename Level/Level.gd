extends Node

onready var ball: KinematicBody2D = $Ball
onready var playerScoreLabel: Label = $PlayerScore
onready var opponentScoreLabel: Label = $OpponentScore

var playerScore: int = 0
var opponentScore: int = 0


func _on_WallLeft_body_entered(body: Node) -> void:
    reset_ball_position()
    opponentScore += 1

    stop_ball_movement()


func _on_WallRight_body_entered(body: Node) -> void:
    reset_ball_position()
    playerScore += 1

    stop_ball_movement()


func reset_ball_position() -> void:
    var resolution = get_viewport().size
    ball.position = Vector2(
        resolution.x / 2,
        resolution.y / 2
    )


func stop_ball_movement() -> void:
    get_tree().call_group("BallGroup", "stop_ball")


func _process(delta: float) -> void:
    playerScoreLabel.text = str(playerScore)
    opponentScoreLabel.text = str(opponentScore)
