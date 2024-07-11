extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var laser_alternator: bool = true
var can_take_dmg: bool = true

var health: int = 30

signal laser(pos, direction)

func hit():
	#print("scout was hit")
	if can_take_dmg:
		health -= 10
		can_take_dmg = false
		$Timers/TakeDmgCooldown.start()
		$Sprite2D.material.set_shader_parameter("progress", 1)
			# sets exposed shader params from inspector
	if health <= 0:
		queue_free()

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
			$Timers/LaserCooldown.start()
			
func _on_attack_area_body_entered(_body):
	player_nearby = true
	
func _on_attack_area_body_exited(_body):
	player_nearby = false

func _on_laser_cooldown_timeout():
	can_laser = true

func _on_take_dmg_cooldown_timeout():
	can_take_dmg = true
