extends LevelParent

func _on_gate_player_entered_gate(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	call_deferred("change_scene")	
	
func change_scene():
	get_tree().change_scene_to_file("res://scenes/levels/inside.tscn")
