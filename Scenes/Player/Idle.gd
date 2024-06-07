extends State

@export
var move_state: State

func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	print("In idle state")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	#if Input.is_action_just_pressed('jump') and parent.is_on_floor():
		#return jump_state
		
	if Input.is_action_just_pressed('left') or Input.is_action_just_pressed('right') or Input.is_action_just_pressed('up') or Input.is_action_just_pressed('down'):
		return move_state
		
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	#not using gravity in this game
	#parent.velocity.y += gravity * delta
	#parent.move_and_slide()
	
	#if !parent.is_on_floor():
		#return fall_state
	return null
