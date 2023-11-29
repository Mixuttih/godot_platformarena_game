extends Node2D




func _on_character_1_pressed():
	Globals.p1_character = "character1"
	

func _on_character_2_pressed():
	Globals.p1_character = "character2"
	

func _on_character_3_pressed():
	Globals.p1_character = "character3"
	

func _on_confirm_pressed():
	if Globals.p1_character == null:
		print("error")
	else:
		get_tree().change_scene_to_file("res://character_select2.tscn")



func _on_return_pressed():
	Globals.p1_character = null
	get_tree().change_scene_to_file("res://main.tscn")
