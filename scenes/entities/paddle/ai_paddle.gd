extends CharacterBody2D
class_name AiPaddle

const SPEED = 150.0
var ball

func _ready():
    ball = get_parent().find_child("Ball")

func _physics_process(delta):
    velocity.y = get_movement_direction() * SPEED
    move_and_collide(velocity * delta)

func get_movement_direction():
    if abs(ball.position.y - position.y) <= 35.0:
        return 0
    elif ball.position.y > position.y:
        return 1
    else:
        return -1
