extends State

@export
var attack_state: State

func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	print("In idle action state")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('lightAttack'):
		return attack_state
		
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
