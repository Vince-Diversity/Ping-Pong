extends "res://Contester.gd"

func _ready():
	position.x = screen_size.x/10

func _physics_process(delta):	# make the physics values more accurate
	var vel = 0
	if Input.is_action_pressed("ui_up"):
		vel -= 1
	if Input.is_action_pressed("ui_down"):
		vel += 1
	position.y += vel * delta * speed		# <but isn't delta fixed for physics?>
