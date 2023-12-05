extends Node2D
class_name Arena

@onready var ui: UI = $UI
@onready var goalzone = $Goalzone
@onready var goalzone_2 = $Goalzone2
@onready var timer: Timer = $CountdownTimer
@onready var score_player = $ScorePlayer

# Called when the node enters the scene tree for the first time.
func _ready():
    if !goalzone.score.is_connected(ui._on_scored):
        goalzone.score.connect(ui._on_scored)
    if !goalzone.start_countdown.is_connected(_on_countdown_timer_start):
        goalzone.start_countdown.connect(_on_countdown_timer_start)
    if !goalzone_2.score.is_connected(ui._on_scored):
        goalzone_2.score.connect(ui._on_scored)
    if !goalzone_2.start_countdown.is_connected(_on_countdown_timer_start):
        goalzone_2.start_countdown.connect(_on_countdown_timer_start)

func _process(delta):
    ui._update_timer_label(round(timer.time_left))

func _on_countdown_timer_start():
    ui.set_timer_visible(true)
    timer.start()
    score_player.play()

func _on_countdown_timer_timeout():
    get_tree().call_group("BallGroup", "start_ball")
    ui.set_timer_visible(false)
