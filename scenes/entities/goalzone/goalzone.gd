extends Area2D
class_name Goalzone

signal score(owner)
signal start_countdown()

@export var player_owner = 1


# Called when the node enters the scene tree for the first time.
func _ready():
    pass
    #connect("start_countdown", self._on_start_countdown)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func _on_body_entered(body):
    if body is Ball:
        body.position = Vector2(576, 324)
        body.get_random_direction()
        body.stop_ball()
        score.emit(player_owner)
        start_countdown.emit()

#func _on_start_countdown():
    #start_countdown.emit()
