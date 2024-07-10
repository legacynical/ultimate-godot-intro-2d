extends Area2D

var rotation_speed: int = 4
var available_options = ["laser", "laser", "laser", "laser", "grenade", "health"]
var type = available_options[randi()%len(available_options)]

func _ready():
	print(type)
	if type == "laser":
		$Sprite2D.modulate = Color(0.1, 0.1, 0.5)
	if type == "grenade":
		$Sprite2D.modulate = Color(0.5, 0.1, 0.1)
	if type == "health":
		$Sprite2D.modulate = Color(0.1, 0.5, 0.1)

func _process(delta):
	rotation += rotation_speed * delta
