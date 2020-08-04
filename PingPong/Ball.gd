extends RigidBody2D

func _ready():
	var s = get_viewport_rect().size
	position = Vector2(s.x/2, s.y/2)
	continuous_cd = true	# collision detection

# Does the check-if-still-in-window do better than Area2D?
