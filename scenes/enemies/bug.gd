extends CharacterBody2D

var player_nearby: bool = false
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
		$Sprite2D.material.set_shader_parameter("progress", 1)
			# sets exposed shader params from inspector
	if health <= 0:
		queue_free()
		
func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos)
		# 1.  move towards player
		if can_attack:
			var pos: Vector2 
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			attack.emit()
			can_attack = false
			$Timers/AttackCooldown.start()
			
func _on_notice_area_body_entered(_body):
	player_nearby = true
	
func _on_attack_area_body_exited(_body):
	player_nearby = false

func _on_attack_cooldown_timeout():
	can_attack = true

func _on_take_dmg_cooldown_timeout():
	can_take_dmg = true
	$Sprite2D.material.set_shader_parameter("progress", 0)
