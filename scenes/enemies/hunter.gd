extends CharacterBody2D

var player_nearby: bool = false
var player_in_range: bool = false
var can_attack: bool = true
var can_take_dmg: bool = true

var speed: int = 200

func _ready():
	$NavigationAgent2D.target_position = Globals.player_pos


func _physics_process(_delta):
	var next_path_pos: Vector2 = $NavigationAgent2D.get_next_path_position()
	var direction: Vector2 = (next_path_pos - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
	

func _on_notice_area_body_entered(_body):
	player_nearby = true

func _on_notice_area_body_exited(_body):
	player_nearby = false

func _on_attack_area_body_entered(_body):
	player_in_range = true

func _on_attack_area_body_exited(_body):
	player_in_range = false


func _on_navigation_timer_timeout():
	if player_nearby:
		$NavigationAgent2D.target_position = Globals.player_pos
