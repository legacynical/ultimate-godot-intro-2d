extends CharacterBody2D

#var is_enemy: bool = true
var player_nearby: bool = false
var can_take_dmg: bool = true

var max_speed: int = 600
var speed: int = 400
var health: int = 50
var speed_multiplier: int = 1

var exploding: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Explosion.hide()
	$DroneImage.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_nearby:
		look_at(Globals.player_pos)
		var direction = (Globals.player_pos - position).normalized()
		velocity = direction * speed * speed_multiplier
		var collision = move_and_collide(velocity * delta)
			# unlike move_and_slide(), move_and_collide doesn't include * delta so you need to use it here
		if collision:
			$AnimationPlayer.play("explosion")
			exploding = true
	if exploding:
		var targets = get_tree().get_nodes_in_group("Container") + get_tree().get_nodes_in_group("Entity")
		for target in targets:
			var in_range = target.global_position.distance_to(global_position) < 400
			if in_range and "hit" in target:
				target.hit()
	
func hit():
	if can_take_dmg:
		health -= 10
		print(health)
		can_take_dmg = false
		$Timers/TakeDmgCooldown.start()
		$DroneImage.material.set_shader_parameter("progress", 1)
	if health <= 0:
		$AnimationPlayer.play("explosion")
		exploding = true

func stop_movement():
	speed_multiplier = 0

func _on_notice_area_body_entered(_body):
	player_nearby = true
	var tween = create_tween()
	tween.tween_property(self, "speed", max_speed, 5)

func _on_take_dmg_cooldown_timeout():
	can_take_dmg = true
	$DroneImage.material.set_shader_parameter("progress", 0)
