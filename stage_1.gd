extends Node2D

@onready var powerup_timer = $powerup_timer
@onready var path_timer = $path_timer
@onready var path_progress_timer = $path_progress_timer
@onready var stop_timer = $stop_timer

@onready var path_follow_2d = $Path2D/PathFollow2D

var rand_start

# Called when the node enters the scene tree for the first time.
func _ready():
	rand_start = randf_range(0.0,1.0)
	path_follow_2d.progress_ratio = rand_start
	path_progress_timer.start()
	path_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_path_timer_timeout():
	powerup_timer.start()
	stop_timer.start()

func _on_powerup_timer_timeout():
	var powerup_trs = load("res://powerup.tscn")
	var powerup = powerup_trs.instantiate()
	powerup.position = path_follow_2d.position
	add_child(powerup)

func _on_path_progress_timer_timeout():
	path_follow_2d.progress_ratio += 0.01
	

func _on_stop_timer_timeout():
	powerup_timer.stop()
	stop_timer.stop()
