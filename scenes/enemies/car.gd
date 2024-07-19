extends PathFollow2D

var player_nearby: bool = false

@onready var line1: Line2D = $Turret/RayCast2D/Line2D
@onready var line2: Line2D = $Turret/RayCast2D2/Line2D

func _ready():
	line2.add_point($Turret/RayCast2D2.target_position)

func _process(delta):
	progress_ratio += 0.0005 * delta
	if player_nearby:
		$Turret.look_at(Globals.player_pos)


func _on_notice_area_body_entered(_body):
	player_nearby = true

func _on_notice_area_body_exited(_body):
	player_nearby = false
