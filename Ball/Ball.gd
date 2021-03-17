extends KinematicBody2D


var speed: int = 600
var velocity: Vector2 = Vector2.ZERO


func _ready() -> void:
    velocity.x = [-1, 1][randi() % 2]
    velocity.y = [-0.8, 0.8][randi() % 2]


func _physics_process(delta: float) -> void:
    move_and_slide(velocity * speed)
