extends State

@export var attack_state: State
@export var bulletTime_state: State
@export var die_state: State

func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	#print("In idle action state")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('lightAttack'):
		return attack_state
		
	if Input.is_action_just_pressed('bulletTime'):
		return bulletTime_state	
		
	if Input.is_action_just_pressed('die'):
		return die_state	
		
	if Input.is_action_just_pressed('ui_cancel'):
		print("pause")
		
		#show overlay
		parent.emit_signal("pauseMenuKeyPressed")
	
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
