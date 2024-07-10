extends Area2D

var rotation_speed: int = 4
var available_options = ["laser", "laser", "laser", "laser", "grenade", "health"]
var type = available_options[randi()%len(available_options)]

func _ready():
	print(type)
	if type == "laser":
		$Sprite2D.modulate = Color(0.1, 0.1, 0.5) #blue
	if type == "grenade":
		$Sprite2D.modulate = Color(0.5, 0.1, 0.1) #red
	if type == "health":
		$Sprite2D.modulate = Color(0.1, 0.5, 0.1) #green

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(body):
	body.add_item(type)
	queue_free()
