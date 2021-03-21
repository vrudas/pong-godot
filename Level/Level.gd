extends Node

onready var ball: KinematicBody2D = $Ball


func _on_WallLeft_body_entered(body: Node) -> void:
    reset_ball_position()


func _on_WallRight_body_entered(body: Node) -> void:
    reset_ball_position()


func reset_ball_position() -> void:
    var resolution = get_viewport().size
    ball.position = Vector2(
        resolution.x / 2,
        resolution.y / 2
    )
