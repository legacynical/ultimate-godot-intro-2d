extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	#print("player entered gate")
	#print(body)


func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
		# angle method converts vector to radians 
		# alt: laser.rotation = direction.angle()
	laser.direction = direction
	
	# 1. update the laser position
	# 2, move the laser
	# 3. add laser instance to a Node2D
	$Projectiles.add_child(laser)
	print("laser from level")


func _on_player_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	print(direction)
	print(grenade.speed)


func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	#tween.tween_property($Player, "modulate:a", 0, 2).from(0.5)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1).set_trans(Tween.TRANS_QUAD)


func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 1)
