extends KinematicBody2D

export var speed = 400
var screen_size
var paddle_size		# from midpoint to corner

func _ready():
	screen_size = get_viewport_rect().size
	position.y = screen_size.y / 2

	# Maybe the capsule shape prevents ball getting stuck
	var paddle_height = $CollisionShape2D.shape.height
	var paddle_radius = $CollisionShape2D.shape.radius
	paddle_size = Vector2(paddle_radius*2, paddle_height/2)
	$ColorRect.margin_top = - paddle_height / 2 - paddle_radius
	$ColorRect.margin_bottom = paddle_height / 2 + paddle_radius
	$ColorRect.margin_right = paddle_radius
	$ColorRect.margin_left = -paddle_radius

func _physics_process(_delta):
	position.y = clamp(position.y, paddle_size.y, screen_size.y - paddle_size.y)
