extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_container_opened)

func _on_container_opened(pos, direction):
	#print("container opened")
	var item = item_scene.instantiate() as Area2D
	item.position = pos
	item.direction = direction
	#$Items.add_child(item)
	$Items.call_deferred("add_child", item)

func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
		# angle method converts vector to radians 
		# alt: laser.rotation = direction.angle()
	laser.direction = direction
	
	# 1. update the laser position
	# 2, move the laser
	# 3. add laser instance to a Node2D
	$Projectiles.add_child(laser)
	#$UI.update_laser_text()
	#print("laser from level")


func _on_player_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	#$UI.update_grenade_text()
	#print(direction)
	#print(grenade.speed)


# player signal to update stats calls available UI func
#func _on_globals_stat_change():
	#$UI.update_stat_text()
