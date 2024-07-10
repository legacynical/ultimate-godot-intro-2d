extends Area2D

var rotation_speed: int = 4
var available_options = ["laser", "laser", "laser", "laser", "grenade", "health"]
var type = available_options[randi()%len(available_options)]

# sets a random item with corresponding colors
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

# calls player add_item func when picked up via player body
func _on_body_entered(body):
	body.add_item(type)
	#if type == "health":
		#Globals.health += 10
	print(Globals.health)
	queue_free()
