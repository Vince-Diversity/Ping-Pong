extends "res://Contester.gd"

func _ready():
	position.x = screen_size.x*9/10

func _process(delta):
	var vel = 0
	if Input.is_action_pressed("ui_up"):
		vel -= 1
	if Input.is_action_pressed("ui_down"):
		vel += 1
	position.y += vel * delta * speed
	position.y = clamp(position.y, 0, screen_size.y - paddle_size.y)		
