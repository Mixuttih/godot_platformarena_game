extends Node2D


func _ready():
	if Globals.p1_character == "character1":
		$Character1.disabled = true
		$Character1.visible = false
		$Char1_taken.visible = true
		
	elif Globals.p1_character == "character2":
		$Character2.disabled = true
		$Character2.visible = false
		$Char2_taken.visible = true
		
	elif Globals.p1_character == "character3":
		$Character3.disabled = true
		$Character3.visible = false
		$Char3_taken.visible = true
		


func _on_character_1_pressed():
	Globals.p2_character = "character1"
	

func _on_character_2_pressed():
	Globals.p2_character  = "character2"
	

func _on_character_3_pressed():
	Globals.p2_character  = "character3"
	

func _on_confirm_pressed():
	if Globals.p2_character == null:
		print("error")
	else:
		get_tree().change_scene_to_file("res://stage_select.tscn")
	
func _on_button_pressed():
	pass



func _on_return_pressed():
	Globals.p1_character = null
	Globals.p2_character = null
	get_tree().change_scene_to_file("res://character_select.tscn")
