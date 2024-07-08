extends Area2D

@export var speed: int = 1000
var direction: Vector2 = Vector2.UP

func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	#if body.has_method("hit"):
	if "hit" in body:
		body.hit()
	#if "is_enemy" in body:
		#print("is enemy")
	queue_free()
