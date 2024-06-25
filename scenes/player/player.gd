extends CharacterBody2D

signal laser(pos)
signal grenade(pos)

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
		# randomly select a marker 2D for the laser start position
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		# emit the laser position selected
		laser.emit(selected_laser.global_position)
		$LaserTimer.start()
	
	if Input.is_action_pressed("secondary action") and can_grenade:
		
		can_grenade = false
		grenade.emit($GrenadeStartPosition.global_position)
		$GrenadeTimer.start()


func _on_laser_timer_timeout():
	can_laser = true
	
func _on_grenade_timer_timeout():
	can_grenade = true
