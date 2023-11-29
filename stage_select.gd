extends Node2D


func _on_stage_1_pressed():
	Globals.stage = "stage1"
	get_tree().change_scene_to_file("res://world.tscn")


func _on_stage_2_pressed():
	Globals.stage = "stage2"
	get_tree().change_scene_to_file("res://world.tscn")
