extends StaticBody2D

@export var visibilityCondition=3 # error ;-; indentifier(????

func signalConnect(your_emitter):
	your_emitter.connect("visibility_value_changed",self,"_on_visibility_value_changed")

func _on_visibility_value_changed(phraseNum):
	if phraseNum <= visibilityCondition:
		self.visible=true
	else:
		self.visible=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#func make_visible():
	#if Input.is_action_pressed("press_1"):
		#self.visibible = true
