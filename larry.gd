extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -370.0

@onready var fondo_verde:CanvasItem = $"../fondo_verde"
@onready var fondo_rosa:CanvasItem = $"../fondo_rosa"
@onready var fondo_azul:CanvasItem = $"../fondo_azul"
@onready var ap = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var steps = $steps
@onready var music = $music
@onready var whoosh = $whoosh
@onready var jump = $jump

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump.play()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x != 0 and is_on_floor():
		if !steps.playing:
			steps.play()
	elif steps.playing:
		steps.stop()
		
	if direction != 0:
		sprite.flip_h = (direction == -1)
	
	update_animations(direction)
	
	move_and_slide()
	
	pass_through()
	

func update_animations(direction):
	if is_on_floor():
		if direction == 0:
			ap.play("quieta_der")
		else:
			ap.play("corre_der")
			

func pass_through():
	if Input.is_action_pressed("press_1"): #desaparece rosa
		set_collision_masks(2, [3,4])
		fondo_rosa.visible = true # aparece fondo rosa
		fondo_verde.visible = false
		fondo_azul.visible = false
		
	if Input.is_action_pressed("press_2"): #desaparece verde
		set_collision_masks(3, [2,4])
		fondo_verde.visible = true # aparece fondo verde
		fondo_rosa.visible = false
		fondo_azul.visible = false
		
	if Input.is_action_pressed("press_3"): #desaparece azul
		set_collision_masks(4, [2,3])
		fondo_azul.visible = true # aparece fondo azul
		fondo_verde.visible = false
		fondo_rosa.visible = false
		
		
	
func set_collision_masks(pass_mask, not_pass_masks):
	set_collision_mask_value(pass_mask, false)
	whoosh.play()
	for not_pass_mask in not_pass_masks:
		set_collision_mask_value(not_pass_mask, true)
	









func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://mensaje.tscn")

func _on_msj_body_entered(body):
	get_tree().change_scene_to_file("res://mensaje_2.tscn")

func _on_msj_fin_body_entered(body):
	get_tree().change_scene_to_file("res://mensaje_fin.tscn")
