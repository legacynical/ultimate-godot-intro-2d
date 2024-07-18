extends CharacterBody2D

var player_nearby: bool = false
var player_in_range: bool = false
var can_attack: bool = true
var can_take_dmg: bool = true

var health: int = 30
var speed: int = 300

signal attack

func hit():
	#print("scout was hit")
	if can_take_dmg:
		health -= 10
		can_take_dmg = false
		$Timers/TakeDmgCooldown.start()
		$AnimatedSprite2D.material.set_shader_parameter("progress", 1)
			# sets exposed shader params from inspector
		$Particles/HitParticles.emitting = true
			# I have no idea why the inspecter params aren't working as expected but it's close enough to
			# the tutorial video visually so I'm just going to move on
	if health <= 0:
		await get_tree().create_timer(0.5).timeout
			# prevents node from destruction before death hit particles
		queue_free()
		
func _process(delta):
	if player_nearby and not player_in_range:
		#move_and_slide()
		look_at(Globals.player_pos)
		# move towards player
		var direction: Vector2 = (Globals.player_pos - position).normalized()
		position += direction * speed * delta
	if player_in_range and can_attack:
		#var pos: Vector2 
		#var direction: Vector2 = (Globals.player_pos - position).normalized()
		print("bug attacking")
		attack.emit()
		can_attack = false
		$Timers/AttackCooldown.start()
			
func _on_notice_area_body_entered(_body):
	#print(body)
	#print("bug noticed player")
	player_nearby = true
	$AnimatedSprite2D.animation = "walk"	
	
func _on_notice_area_body_exited(_body):
	player_nearby = false
	
func _on_attack_area_body_entered(_body):
	player_in_range = true
	$AnimatedSprite2D.animation = "attack"
	
func _on_attack_area_body_exited(_body):
	player_in_range = false

func _on_attack_cooldown_timeout():
	can_attack = true

func _on_take_dmg_cooldown_timeout():
	can_take_dmg = true
	$AnimatedSprite2D.material.set_shader_parameter("progress", 0)
# TODO 
# fix shader to activate on each bug instance


func _on_animated_sprite_2d_animation_finished():
	if player_nearby:
		Globals.health -= 10
