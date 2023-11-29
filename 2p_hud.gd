extends Control

@onready var health_bar = $HealthBar
@onready var stamina_bar = $StaminaBar
@onready var power_bar = $PowerBar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	health_bar.value = Globals.p2_health
	stamina_bar.value = Globals.p2_stamina
	power_bar.value = Globals.p2_power
	

