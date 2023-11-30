extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#Load stage
	if Globals.stage == "stage1":
		var stage_trs = load("res://stage_1.tscn")
		var stage = stage_trs.instantiate()
		add_child(stage)
	elif Globals.stage == "stage2":
		var stage_trs = load("res://stage_2.tscn")
		var stage = stage_trs.instantiate()
		add_child(stage)
	
	#Load character
	if Globals.p1_character == "character1":
		#Add player 1 character
		var char1_trs = load("res://character1.tscn")
		var char1 = char1_trs.instantiate()
		char1.set_script(load("res://1p_controls.gd"))
		char1.set_global_position(Vector2(240, 600))
		add_child(char1)
		
		var particles_trs = load("res://particles.tscn")
		var particles = particles_trs.instantiate()
		char1.add_child(particles)
		
	elif Globals.p1_character == "character2":
		#Add player 1 character
		var char1_trs = load("res://character2.tscn")
		var char1 = char1_trs.instantiate()
		char1.set_script(load("res://1p_controls.gd"))
		char1.set_global_position(Vector2(240, 600))
		add_child(char1)
		
		var particles_trs = load("res://particles.tscn")
		var particles = particles_trs.instantiate()
		char1.add_child(particles)
		
	elif Globals.p1_character == "character3":
		#Add player 1 character
		var char1_trs = load("res://character3.tscn")
		var char1 = char1_trs.instantiate()
		char1.set_script(load("res://1p_controls.gd"))
		char1.set_global_position(Vector2(240, 600))
		add_child(char1)
		
		var particles_trs = load("res://particles.tscn")
		var particles = particles_trs.instantiate()
		char1.add_child(particles)
		
	if Globals.p2_character == "character1":
		#Add player 2 character
		var char2_trs = load("res://character1.tscn")
		var char2 = char2_trs.instantiate()
		char2.set_script(load("res://2p_controls.gd"))
		char2.set_global_position(Vector2(1680, 600))
		add_child(char2)
		
		var particles_trs = load("res://particles2.tscn")
		var particles = particles_trs.instantiate()
		char2.add_child(particles)
		
		
	elif Globals.p2_character == "character2":
		#Add player 2 character
		var char2_trs = load("res://character2.tscn")
		var char2 = char2_trs.instantiate()
		char2.set_script(load("res://2p_controls.gd"))
		char2.set_global_position(Vector2(1680, 600))
		add_child(char2)
		
		var particles_trs = load("res://particles2.tscn")
		var particles = particles_trs.instantiate()
		char2.add_child(particles)
		
	elif Globals.p2_character == "character3":
		#Add player 2 character
		var char2_trs = load("res://character3.tscn")
		var char2 = char2_trs.instantiate()
		char2.set_script(load("res://2p_controls.gd"))
		char2.set_global_position(Vector2(1680, 600))
		add_child(char2)
		
		var particles_trs = load("res://particles2.tscn")
		var particles = particles_trs.instantiate()
		char2.add_child(particles)
	
	#Load HUD
	var hud1_trs = load("res://1p_hud.tscn")
	var hud1 = hud1_trs.instantiate()
	add_child(hud1)
	
	var hud2_trs = load("res://2p_hud.tscn")
	var hud2 = hud2_trs.instantiate()
	add_child(hud2)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Quit-button
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()


