extends Node

var laser_amount = 20
var grenade_amount = 5
var health = 70:
	get: # triggered by reading
		print("health value was read")
	set(value): # triggered by updating
		print("health value was changed")
