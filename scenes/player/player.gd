extends Node2D

var speed = 500

func _process(delta):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	#print(direction)
	position += direction * speed * delta

	# laser shooting input
	if Input.is_action_pressed("primary action"):
		print("shoot laser")
	
	if Input.is_action_pressed("secondary action"):
		print("secondary action")
