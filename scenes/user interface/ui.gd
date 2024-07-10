extends CanvasLayer

# colors
var green: Color = Color("6bbfa3")
var red: Color = Color(0.9, 0, 0, 1)

#onready var are basically _ready() declared var that can be used globally
#outside of the _ready() func
@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_icon: TextureRect = $GrenadeCounter/VBoxContainer/TextureRect
@onready var health_bar: TextureProgressBar = $MarginContainer/TextureProgressBar

func _ready():
	update_stat_text() 
	# connect to stat_change signal from Globals (signal name, func to call)
	Globals.connect("stat_change", update_stat_text)
		# whenever stats are changed, stat text gets updated
	
func update_laser_text():
	laser_label.text = str(Globals.laser_amount)
	update_color(Globals.laser_amount, laser_label, laser_icon)
	
func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, grenade_label, grenade_icon)

func update_health_text():
	health_bar.value = Globals.health
	
func update_stat_text():
	update_laser_text()
	update_grenade_text()
	update_health_text()

func update_color(amount: int, label: Label, icon: TextureRect) -> void:
	if amount <= 0:
		label.modulate = red
		icon.modulate = red
	else:
		label.modulate = green
		icon.modulate = green
		
