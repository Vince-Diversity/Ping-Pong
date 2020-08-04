extends Area2D

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	$Side.shape.a = Vector2(screen_size.x,0)
	$Side.shape.b = screen_size
