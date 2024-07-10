extends CanvasLayer

# colors
var green: Color = Color("6bbfa3")
var red: Color = Color(0.9, 0, 0, 1)

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_icon: TextureRect = $GrenadeCounter/VBoxContainer/TextureRect


func _ready():
	update_laser_text()
	update_grenade_text()
	
func update_laser_text():
	laser_label.text = str(Globals.laser_amount)
	laser_label.modulate = green
	
func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amount)
	grenade_label.modulate = red
