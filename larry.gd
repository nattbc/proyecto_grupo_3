extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
	pass_through()
	

func pass_through():
	if Input.is_action_pressed("press_1"): #desaparece rosa
		set_collision_masks(2, [3,4])
		#set_visibility_layers(2, [3,4]) # aparece fondo rosa
		
	if Input.is_action_pressed("press_2"): #desaparece verde
		set_collision_masks(3, [2,4])
		#set_visibility_layers(3, [2,4]) # aparece fondo verde
		
	if Input.is_action_pressed("press_3"): #desaparece azul
		set_collision_masks(4, [2,3])
		#set_visibility_layers(4, [2,3]) # aparece fondo azul
		#$fondo_celeste.visible= true
		#$fondo_verde.visible= false
		#$fondo_rosa.visible= false
	
func set_collision_masks(pass_mask, not_pass_masks):
	set_collision_mask_value(pass_mask, false)
	for not_pass_mask in not_pass_masks:
		set_collision_mask_value(not_pass_mask, true)
	
#func set_visibility_layers(show_layer, not_show_layers):
	#set_visibility_layer_bit(show_layer, true)
	#for not_show_layer in not_show_layers:
		#set_visibility_layer_bit(not_show_layer, false)


