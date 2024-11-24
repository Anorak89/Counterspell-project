#extends CharacterBody2D
#
## Movement variables
#var speed = 200  # Horizontal speed
#var gravity = 780  # Gravity force
#var jump_force = -400  # Upward force for jumping
#
## Reference to Player1
#var player1
#
#func _ready():
	## Cache Player1 reference for better performance
	#player1 = $"../Player1"
#
#func _process(delta):
	## Apply gravity
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Check Player1's velocity to decide mirroring or independent movement
	#if player1 and player1.velocity.length() > 0:
		## Mirror Player1's movement
		#mirror_player1_movement(delta)
	#else:
		## Independent movement for Player2
		#handle_independent_movement(delta)
#
	## Move Player2
	#move_and_slide()
#
	## Update Player2 animations
	#update_player2_animations()
#
## Function to mirror Player1's movement
#func mirror_player1_movement(delta):
	#velocity.x = -player1.velocity.x  # Invert Player1's horizontal velocity
	#if not is_on_floor():
		#velocity.y += gravity * delta  # Apply gravity to Player2 if in the air
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = jump_force  # Mirror Player1's jump action
#
## Independent movement for Player2
#func handle_independent_movement(delta):
	## Horizontal movement for Player2
	#var direction_x = Input.get_action_strength("player2_right") - Input.get_action_strength("player2_left")
	#velocity.x = direction_x * speed
#
	## Jumping for Player2
	#if Input.is_action_just_pressed("player2_jump") and is_on_floor():
		#velocity.y = jump_force
#
## Update Player2 animations based on state
#func update_player2_animations():
	#if is_on_floor():
		#if velocity.x != 0:
			#$AnimationPlayer2.play("walk")  # Play walk animation when moving
		#else:
			#$AnimationPlayer2.play("idle")  # Play idle animation when stationary
	#else:
		#$AnimationPlayer2.play("jump")  # Play jump animation when in the air
extends CharacterBody2D

# Movement variables
var speed = 200  # Horizontal speed
var gravity = 1500  # Gravity force
var jump_force = -400  # Upward force for jumping

func _process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle horizontal movement
	handle_horizontal_movement()

	# Handle jumping
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_force

	# Move Player2
	move_and_slide()

	# Update Player2 animations
	update_player2_animations()

# Handles horizontal movement for Player2
func handle_horizontal_movement():
	# Use inverted inputs for Player2 movement
	var direction_x = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	velocity.x = direction_x * speed

# Update Player2 animations based on state
func update_player2_animations():
	if is_on_floor():
		if velocity.x != 0:
			$AnimationPlayer2.play("walk")  # Play walk animation when moving
		else:
			$AnimationPlayer2.play("idle")  # Play idle animation when stationary
	else:
		$AnimationPlayer2.play("jump")  # Play jump animation when in the air
