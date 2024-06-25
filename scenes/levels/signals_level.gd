extends Node2D


func _on_gate_player_entered_gate(body):
	print("player entered gate")
	print(body)


func _on_player_laser():
	print("laser from level")


func _on_player_grenade():
	print("grenade from level")
