extends Node

signal health_change

var laser_amount = 20
var grenade_amount = 5
var health = 70:
	get: # triggered by reading
		return health
	set(value): # triggered by updating
		health = value
		health_change.emit()
