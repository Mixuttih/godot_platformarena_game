extends Node2D
@onready var destroy_timer = $destroy_timer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_destroy_timer_timeout():
	queue_free()


func _on_area_2d_body_entered(body):
	if body.name == Globals.p1_character:
		Globals.p1_power += 10
		queue_free()
	elif body.name == Globals.p2_character:
		Globals.p2_power += 10
		queue_free()
