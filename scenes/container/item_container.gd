extends StaticBody2D
class_name ItemContainer

# this scene is added to Groups as "Container" which can be accessed outside
# along with all its children via get_tree().get_nodes_in_group("Container")

signal open(pos, direction)

var container_hit_sound: AudioStreamPlayer2D

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)
	# down is default item direction, then rotated by current rotation
	# onready used to prevent calc before node creation
var opened: bool = false

func _ready():
	container_hit_sound = AudioStreamPlayer2D.new()
	container_hit_sound.stream = load("res://audio/container_hit.mp3")
	add_child(container_hit_sound)
