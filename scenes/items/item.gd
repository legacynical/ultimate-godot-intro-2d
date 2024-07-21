extends Area2D

var rotation_speed: int = 4
var available_options = ["laser", "laser", "laser", "laser", "grenade", "health"]
var type = available_options[randi()%len(available_options)]

var direction: Vector2
var distance: int = randi_range(150, 250) 

# sets a random item with corresponding colors
func _ready():
	print(type)
	if type == "laser":
		$Sprite2D.modulate = Color(0.1, 0.1, 0.5) #blue
	if type == "grenade":
		$Sprite2D.modulate = Color(0.5, 0.1, 0.1) #red
	if type == "health":
		$Sprite2D.modulate = Color(0.1, 0.5, 0.1) #green

	# tween
	var target_pos = position + direction * distance
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", target_pos, 0.5)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.3).from(Vector2(0, 0))
	
func _process(delta):
	rotation += rotation_speed * delta

# calls player add_item func when picked up via player body
func _on_body_entered(_body):
	#body.add_item(type)
	if type == "laser":
		Globals.laser_amount += 5
	if type == "grenade":
		Globals.grenade_amount += 1
	if type == "health":
		Globals.health += 10
	$AudioStreamPlayer2D.play()
	$Sprite2D.hide()
	await $AudioStreamPlayer2D.finished
	queue_free()
