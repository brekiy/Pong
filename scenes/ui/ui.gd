extends CanvasLayer
class_name UI

@onready var p1_score_label = %P1ScoreLabel
@onready var p2_score_label = %P2ScoreLabel
@onready var timer_label = %TimerLabel

var p1_score = 0:
    set(new_score):
        p1_score = new_score
        _update_p1_score_label()
        
var p2_score = 0:
    set(new_score):
        p2_score = new_score
        _update_p2_score_label()

func _ready():
    _update_p1_score_label()
    _update_p2_score_label()
    
func _on_scored(owner) -> void:
    if owner == 1:
        p2_score += 1
    else:
        p1_score += 1

func _update_p1_score_label():
    p1_score_label.text = str(p1_score)
    
func _update_p2_score_label():
    p2_score_label.text = str(p2_score)
    
func _update_timer_label(time):
    timer_label.text = str(time)

func set_timer_visible(value):
    timer_label.visible = value
