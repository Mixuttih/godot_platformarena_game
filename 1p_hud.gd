extends Control
@onready var health_bar = $HealthBar
@onready var stamina_bar = $StaminaBar
@onready var power_bar = $PowerBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	health_bar.value = Globals.p1_health
	stamina_bar.value = Globals.p1_stamina
	power_bar.value = Globals.p1_power
	
	if Globals.p1_health <= 0:
		$RematchButton.visible = true
		$ResetButton.visible = true
		$P2_wins.visible = true
	elif Globals.p2_health <= 0:
		$RematchButton.visible = true
		$ResetButton.visible = true
		$P1_wins.visible = true


func _on_rematch_button_pressed():
	Globals.p1_health = 100
	Globals.p1_stamina = 100
	Globals.p1_power = 0
	
	Globals.p2_health = 100
	Globals.p2_stamina = 100
	Globals.p2_power = 0
	
	$RematchButton.visible = false
	$ResetButton.visible = false
	$P1_wins.visible = false
	$P2_wins.visible = false
	
	get_tree().reload_current_scene()

func _on_reset_button_pressed():
	Globals.p1_health = 100
	Globals.p1_stamina = 100
	Globals.p1_power = 0
	
	Globals.p2_health = 100
	Globals.p2_stamina = 100
	Globals.p2_power = 0
	
	Globals.p1_character = null
	Globals.p2_character = null
	
	$RematchButton.visible = false
	$ResetButton.visible = false
	get_tree().change_scene_to_file("res://main.tscn")
