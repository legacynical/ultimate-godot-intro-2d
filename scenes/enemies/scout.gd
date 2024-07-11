extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var laser_alternator: int = 1
var pos: Vector2

signal laser(pos, direction)

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos)
		if can_laser:
			var laser_markers = $LaserSpawnPositions.get_children()
			if laser_alternator == 1:
				pos = laser_markers[0].global_position
				laser_alternator = 0
			else:
				pos = laser_markers[1].global_position
				laser_alternator = 1
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
