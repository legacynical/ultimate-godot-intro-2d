extends CharacterBody2D

var speed = 500

func _process(_delta):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	#print(direction)
	#position += direction * speed * delta (not used for CharacterBody2D)
	velocity = direction * speed
	move_and_slide() # includes delta
	
	# laser shooting input
	if Input.is_action_pressed("primary action"):
		print("shoot laser")
	
	if Input.is_action_pressed("secondary action"):
		print("shoot grenade")
