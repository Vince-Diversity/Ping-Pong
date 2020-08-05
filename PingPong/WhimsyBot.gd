extends "res://Contester.gd"

var focus	# what the bot is looking at
var vel
var mid
export var acc = 8		# how accurately Bot can tell when to swing

func _ready():
	position.x = screen_size.x*9/10
	mid = screen_size.y / 2

func _physics_process(delta):
	vel = 0
	var foc_vel = focus.linear_velocity
	if foc_vel.x > 0:
		if position.x - focus.position.x < abs(foc_vel.x)/acc:
			swinging()
		else:
			preparing()
	if foc_vel.x < 0:
		swinging()	# just to return to middle
	position.y += vel * delta * speed		# <but isn't delta fixed for physics?>

func preparing():
	var paddle_top = position.y - paddle_size.y
	var paddle_bot = position.y + paddle_size.y
	if focus.position.y < paddle_bot \
		and focus.position.y < mid:
		vel -= 1
		stabilise(focus.position.y, paddle_bot)
	elif focus.position.y > paddle_top \
		and focus.position.y > mid:
		vel += 1
		stabilise(focus.position.y, paddle_top)
	else:	# The focus is moving towards the middle!
		swinging()

func swinging():
	if mid < position.y:
		vel -= 1
	if mid > position.y:
		vel += 1
	stabilise(mid, position.y)

func stabilise(target, me):		# make it less shaky
	if abs(target - me) < paddle_size.y / 5:
		vel = vel / 10
