extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")

func _on_gate_player_entered_gate(body):
	print("player entered gate")
	print(body)


func _on_player_laser():
	var laser = laser_scene.instantiate()
	add_child(laser)
	print("laser from level")


func _on_player_grenade():
	print("grenade from level")
