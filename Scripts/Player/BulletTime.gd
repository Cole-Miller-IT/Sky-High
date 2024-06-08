extends State

@export var idle_state: State


func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	print("In bulletTime state")
	
	

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	#Change to a hotkey later
	if Input.is_action_just_pressed('bulletTime'):
		return idle_state
		
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
