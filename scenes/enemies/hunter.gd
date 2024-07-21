extends CharacterBody2D

var player_nearby: bool = false
var player_in_range: bool = false
var can_attack: bool = true
var can_take_dmg: bool = true

var health: int = 100
var speed: int = 200

func _ready():
	$NavigationAgent2D.path_desired_distance = 4.0
	$NavigationAgent2D.target_desired_distance = 4.0	
	$NavigationAgent2D.target_position = Globals.player_pos


func _physics_process(_delta):
	if player_nearby:
		var next_path_pos: Vector2 = $NavigationAgent2D.get_next_path_position()
		var direction: Vector2 = (next_path_pos - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		var look_angle = direction.angle()
		rotation = look_angle + PI  / 2
		
func _on_notice_area_body_entered(_body):
	player_nearby = true
	$AnimationPlayer.play("walk")

func _on_notice_area_body_exited(_body):
	player_nearby = false

func _on_attack_area_body_entered(_body):
	player_in_range = true
	$AnimationPlayer.play("attack")

func _on_attack_area_body_exited(_body):
	player_in_range = false

func attack():
	if player_in_range:
		Globals.health -= 20

func _on_navigation_timer_timeout():
	if player_nearby:
		$NavigationAgent2D.target_position = Globals.player_pos


func _on_attack_cooldown_timeout():
	# the attack animation (w/ length of 2 seconds) that calls the attack function
	# basically also doubles as the cooldown time
	pass

func hit():
	if can_take_dmg:
		health -= 10
		can_take_dmg = false
		$Timers/TakeDmgCooldown.start()
		$HitSound.play()
	if health <= 0:
		queue_free()

func _on_take_dmg_cooldown_timeout():
	can_take_dmg = true
