extends State


@export
var idle_action_state: State

func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	print("In attack state")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed("lightAttack"):
		#print("in light attack state")
		return null
		
	if Input.is_anything_pressed() == false:
		return idle_action_state
	
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
	
