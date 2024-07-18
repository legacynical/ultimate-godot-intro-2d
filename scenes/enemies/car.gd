extends PathFollow2D

func _process(delta):
	progress_ratio += 0.05 * delta


func _on_notice_area_body_entered(body):
	pass # Replace with function body.


func _on_notice_area_body_exited(body):
	pass # Replace with function body.
