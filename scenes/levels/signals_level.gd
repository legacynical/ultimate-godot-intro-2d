extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body):
	print("player entered gate")
	print(body)


func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	laser.position = pos
	# 1. update the laser position
	# 2, move the laser
	# 3. add laser instance to a Node2D
	$Projectiles.add_child(laser)
	print("laser from level")


func _on_player_grenade(pos, player_direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = player_direction * grenade.speed
	$Projectiles.add_child(grenade)
	print(player_direction)
	print(grenade.speed)
