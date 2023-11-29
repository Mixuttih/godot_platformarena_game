extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DASH = SPEED * 10

var jump_count = 1
var dashing = false

var health = 100
var stamina = 100


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	#Update stats for HUD
	Globals.p1_health = health
	Globals.p1_stamina = stamina
	
	if health <= 0:
		queue_free()
	
	#Stamina bar refill per frame
	if stamina < 100:
		stamina += 0.2
	
	if dashing:
		collision_layer = 2
		collision_mask = 2
	else:
		collision_layer = 1
		collision_mask = 1
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and not dashing and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Double jump
	if Input.is_action_just_pressed("jump") and not dashing and jump_count == 1 and not is_on_floor() and stamina >= 10:
		velocity.y = JUMP_VELOCITY
		jump_count -= 1
		stamina -= 10
	
	#Double jump reset
	if is_on_floor():
		jump_count = 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	
	#Dashing
	if Input.is_action_just_pressed("dash") and not dashing and stamina >= 20 and direction:
		dashing = true
		velocity.x += direction * DASH
		stamina -= 20
		await get_tree().create_timer(0.1).timeout
		dashing = false
	
	#Normal movement
	if direction and not dashing:
		velocity.x = direction * SPEED
		
		if not is_on_floor():
			animated_sprite_2d.play("jump")
			if direction == 1:
				animated_sprite_2d.flip_h = false
			elif direction == -1:
				animated_sprite_2d.flip_h = true
		else:
			if direction == 1:
				animated_sprite_2d.play("walk")
				animated_sprite_2d.flip_h = false
			elif direction == -1:
				animated_sprite_2d.play("walk")
				animated_sprite_2d.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		if not is_on_floor():
			animated_sprite_2d.play("jump")
		else:
			animated_sprite_2d.play("idle")
			
	move_and_slide()

func _on_hit_detection_body_entered(body):
	print("1p:")
	print(body)
	if body.name != Globals.p1_character:
		if dashing == false:
			print(" and took damage")
			health -= (Globals.p2_power / 10) + 10
			Globals.p1_power -= 10
	elif body.name == "Node2D":
		pass
	else:
		print(" but it was himself")

