extends CanvasLayer

signal reset
var left_score = 0
var right_score = 0

func _ready():
	$LeftS.text = str(left_score)
	$RightS.text = str(right_score)
	$Reset.connect('pressed', self, "on_Reset_pressed")

func count_score(side):
	if side == "left":
		right_score += 1
		$RightS.text = str(right_score)
	if side == "right":
		left_score += 1
		$LeftS.text = str(left_score)

func on_Reset_pressed():
	emit_signal("reset")

func score_to_left():
	left_score += 1
	$LeftS.text = str(left_score)

func score_to_right():
	right_score += 1
	$RightS.text = str(right_score)
