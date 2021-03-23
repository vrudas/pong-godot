extends KinematicBody2D


var speed: int = 600
var velocity: Vector2 = Vector2.ZERO


func _ready() -> void:
    randomize()
    velocity.x = [-1, 1][randi() % 2]
    velocity.y = [-0.8, 0.8][randi() % 2]


func _physics_process(delta: float) -> void:
    var collision_object = move_and_collide(velocity * speed * delta)

    if collision_object:
        velocity = velocity.bounce(collision_object.normal)


func stop_ball() -> void:
    speed = 0
