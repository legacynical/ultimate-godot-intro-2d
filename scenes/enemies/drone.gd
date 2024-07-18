extends CharacterBody2D

#var is_enemy: bool = true
var player_nearby: bool = false
var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos)
		var direction = (Globals.player_pos - position).normalized()
		velocity = direction * speed
		move_and_slide()

func hit():
	print("drone hit")


func _on_notice_area_body_entered(body):
	player_nearby = true
