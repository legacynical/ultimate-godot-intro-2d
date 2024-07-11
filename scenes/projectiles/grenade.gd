extends RigidBody2D

const speed = 750
var exploding: bool = false
var explosion_radius: int = 400

func explode():
	exploding = true
	$AnimationPlayer.play("Explosion")
	await $AnimationPlayer.animation_finished
	exploding = false
	
func _process(_delta):
	if exploding:
		var targets = get_tree().get_nodes_in_group("Container") + get_tree().get_nodes_in_group("Entity")
		for target in targets:
			var in_range = target.global_position.distance_to(global_position) < explosion_radius
			if "hit" in target and in_range:
				target.hit()

	
