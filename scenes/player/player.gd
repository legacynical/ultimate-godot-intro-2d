extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

var speed = 500

func _process(_delta):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	#print(direction)
	#position += direction * speed * delta (not used for CharacterBody2D)
	velocity = direction * speed
	move_and_slide() # includes delta
	
	# laser shooting input
	if Input.is_action_pressed("primary action") and can_laser:
		print("shoot laser")
		can_laser = false
	
	if Input.is_action_pressed("secondary action") and can_grenade:
		print("shoot grenade")
		can_grenade = false


func _on_laser_timer_timeout():
	can_laser = true

func _on_grenade_timer_timeout():
	can_grenade = true
