extends Area2D

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	$Side.shape.a = Vector2(0,0)
	$Side.shape.b = Vector2(0,screen_size.y)
