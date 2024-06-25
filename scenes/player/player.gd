extends CharacterBody2D

signal laser
signal grenade

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
		can_laser = false
		laser.emit()
	
	if Input.is_action_pressed("secondary action") and can_grenade:
		can_grenade = false
		grenade.emit()


func _on_laser_timer_timeout():
	can_laser = true
	$LaserTimer.start()
	
func _on_grenade_timer_timeout():
	can_grenade = true
	$GrenadeTimer.start()
