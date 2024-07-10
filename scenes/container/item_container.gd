extends StaticBody2D
class_name ItemContainer

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)
	# down is default item direction, then rotated by current rotation
	# onready used to prevent calc before node creation
