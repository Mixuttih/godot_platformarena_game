extends Node2D




func _ready():
	if Globals.fullscreen == false:
		get_window().size = Vector2i(1280,720)
	
func _process(_delta):
	if Input.is_action_just_pressed("fullscreen") and Globals.fullscreen == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		Globals.fullscreen = true
	elif Input.is_action_just_pressed("fullscreen") and Globals.fullscreen == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		Globals.fullscreen = false
	
func _on_start_pressed():
	get_tree().change_scene_to_file("res://character_select.tscn")


func _on_quit_pressed():
	get_tree().quit()
