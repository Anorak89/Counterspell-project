extends CharacterBody2D

# Movement variables
var speed = 200  # Horizontal speed
var gravity = 1500  # Gravity force
var jump_force = -400  # Upward force for jumping

func _process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Horizontal movement
	var direction_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction_x * speed

	# Handle animations based on movement state
	if is_on_floor():
		if direction_x != 0:
			$AnimationPlayer1.play("walk")
		else:
			$AnimationPlayer1.play("idle")
	else:
		$AnimationPlayer1.play("jump")  # Play jump animation when in the air

	# Jumping
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force

	# Move Player1
	move_and_slide()
