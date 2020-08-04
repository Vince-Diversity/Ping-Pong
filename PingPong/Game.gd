extends Node

var BallPacket = preload("res://Ball.tscn")
var ball

func _ready():
	$LeftOut.connect("body_entered", self, "on_Left_out")
	$RightOut.connect("body_entered", self, "on_Right_out")
	$Scores.connect("reset", self, "on_Reset")

	randomize()		# seed, that is
	spawn_ball()

func spawn_ball():
	ball = BallPacket.instance()
	call_deferred("add_child", ball)	# wait 4 stuff
#	ball.linear_velocity = Vector2(200, -100) # good for tests
	ball.linear_velocity = Vector2(200+randi()%201, -100+randi()%201)
	$WhimsyBot.focus = ball

func new_ball():
		ball.queue_free()
		spawn_ball()

func on_Left_out(body):
	if	!(body == $Walls \
		or body == $Player \
		or body == $WhimsyBot):	# stuff overlap during instancing, how to solve?
		$Scores.score_to_right()
		new_ball()

func on_Right_out(body):
	if	!body == $Walls:
		$Scores.score_to_left()
		new_ball()

func on_Reset():
	new_ball()
