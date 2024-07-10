extends CharacterBody2D

signal laser(pos, direction)
signal grenade(pos, direction)

var can_laser: bool = true
var can_grenade: bool = true

@export var max_speed: int = 500
var speed: int = max_speed

func _process(_delta):
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	#print(direction)
	#position += direction * speed * delta (not used for CharacterBody2D)
	velocity = direction * speed
	move_and_slide() # includes delta
	
	# rotate
	look_at(get_global_mouse_position())
	
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	# laser shooting input
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		$GPUParticles2D.emitting = true
		# randomly select a marker 2D for the laser start position
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		# emit the laser position selected
		$LaserTimer.start()
		laser.emit(selected_laser.global_position, player_direction)
	
	# grenade shooting input
	if Input.is_action_pressed("secondary action") and can_grenade:
		can_grenade = false
		$GrenadeTimer.start()
		var pos = $LaserStartPositions.get_children()[0].global_position
		grenade.emit(pos, player_direction)


func _on_laser_timer_timeout():
	can_laser = true
	
func _on_grenade_timer_timeout():
	can_grenade = true
