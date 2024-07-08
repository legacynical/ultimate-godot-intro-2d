extends CharacterBody2D

#var is_enemy: bool = true
var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# direction
	var direction = Vector2.RIGHT
	
	# velocity
	velocity = direction * speed
	
	# move and slide
	move_and_slide()

func hit():
	print("drone hit")
