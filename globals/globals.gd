extends Node

# emit signals for UI to connect to
signal stat_change

var laser_amount = 20:
	get: # triggered by reading
		return laser_amount
	set(value): # triggered by updating
		laser_amount = value
		stat_change.emit()
var grenade_amount = 5:
	set(value):
		grenade_amount = value
		stat_change.emit()
var health = 70:
	set(value):
		health = value
		stat_change.emit()
