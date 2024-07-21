extends Node

# emit signals for UI to connect to
signal stat_change

var player_hit_sound: AudioStreamPlayer2D

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

var player_can_take_dmg: bool = true
var health = 70:
	set(value):
		if value > health:
			health = min(value, 100)
		else:
			if player_can_take_dmg and value < health:
				health = value
				player_can_take_dmg = false
				player_take_dmg_cooldown()
				player_hit_sound.play()
		stat_change.emit()
			
func player_take_dmg_cooldown():
	await get_tree().create_timer(0.5).timeout
	player_can_take_dmg = true
	
var player_pos: Vector2

func _ready():
	player_hit_sound = AudioStreamPlayer2D.new()
	player_hit_sound.stream = load("res://audio/solid_impact.ogg")
	add_child(player_hit_sound)
