extends CharacterBody2D
class_name Ball

@onready var bounce_sound = $BounceSound
const DEFAULT_SPEED = 600.0
const SLOW_SPEED = 300.0
var speed = SLOW_SPEED

# Called when the node enters the scene tree for the first time.
func _ready():
    randomize()
    get_random_direction()

func _physics_process(delta):
    var collision_object = move_and_collide(velocity * speed * delta)
    if collision_object:
        velocity = velocity.bounce(collision_object.get_normal())
        bounce_sound.play()
        speed = DEFAULT_SPEED

func get_random_direction():
    velocity.x = [-1, 1][randi() % 2]
    velocity.y = [-0.8, -0.2, 0.2, 0.8][randi() % 4]

func stop_ball():
    speed = 0.0

func start_ball():
    speed = SLOW_SPEED
