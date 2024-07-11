extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var laser_alternator: bool = true

signal laser(pos, direction)

func hit():
	print("scout was hit")

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos)
		if can_laser:
			var pos: Vector2
			if laser_alternator:
				pos = $LaserSpawnPositions.get_child(0).global_position
				laser_alternator = not laser_alternator
			else:
				pos = $LaserSpawnPositions.get_child(1).global_position
				laser_alternator = not laser_alternator
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			laser.emit(pos, direction)
			can_laser = false
			$LaserCooldown.start()
			
func _on_attack_area_body_entered(_body):
	player_nearby = true
	
func _on_attack_area_body_exited(_body):
	player_nearby = false

func _on_laser_cooldown_timeout():
	can_laser = true
