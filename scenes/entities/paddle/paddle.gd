extends CharacterBody2D
class_name Paddle

const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
@export var player_number = 1


func _physics_process(delta):
    # Get the input direction and handle the movement/deceleration.
    # As good practice, you should replace UI actions with custom gameplay actions.
    var direction
    if player_number == 1:
        direction = Input.get_axis("p1_up", "p1_down")
    else:
        direction = Input.get_axis("p2_up", "p2_down")
    if direction:
        velocity.y = direction * SPEED
    else:
        velocity.y = 0
    move_and_slide()
