extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func pass_through_rosa():#no se si va a aca o en larry ;-;
	if Input.is_action_pressed("press_1"):
		set_collision_mask_value(2, false)#pasa x el rosa
		set_collision_mask_value(3, true)#no pasa por el verde
