extends KinematicBody2D

const MIN_BALL_ABSOLUTE_POSITION: int = 25

const MOVE_UP: int = -1
const MOVE_DOWN: int = 1

const STAY_STILL: int = 0

var speed: int = 250
var ball: KinematicBody2D


func _ready() -> void:
    ball = get_parent().find_node("Ball")
    pass


func _physics_process(delta: float) -> void:
    move_and_slide(Vector2(0, get_opponent_direction()) * speed)


func get_opponent_direction() -> int:
    var ball_absolute_position: float = abs(ball.position.y - position.y)
    var opponent_should_move_to_ball: bool = ball_absolute_position > MIN_BALL_ABSOLUTE_POSITION

    if opponent_should_move_to_ball:
        if ball.position.y > position.y:
            return MOVE_DOWN
        else:
            return MOVE_UP
    else:
        return STAY_STILL
