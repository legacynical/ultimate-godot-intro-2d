extends Node2D

var test_array: Array[String] = ["Test", "fizz", "buzz"]

func _ready():
	#get_node("Logo").rotation_degree = 90
	$Logo.rotation_degrees = 90 # same as above
	
	for i in test_array:
		print(i)
	
func _process(delta):
	$Logo.rotation_degrees += 1
	
	# flow -> if rotation > 100 -> 0
	if $Logo.rotation_degrees > 180:
		$Logo.rotation_degrees = 0
	
	if $Logo.position.x > 1000:
		$Logo.pos.x = 0
