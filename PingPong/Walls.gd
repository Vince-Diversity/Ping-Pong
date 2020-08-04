extends StaticBody2D

var screen_size
export var thickness = 12	# maybe needs a thicker wall

func _ready():
	screen_size = get_viewport_rect().size

	$Top.shape.extents = Vector2(screen_size.x, thickness)
	$Top.position = Vector2(0, -thickness)
	$Bot.shape.extents = Vector2(screen_size.x, thickness)
	$Bot.position = Vector2(0, screen_size.y)
