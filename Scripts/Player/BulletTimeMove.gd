extends State

@export var move_state: State


func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	print("In bulletTime Move state")

	#slow down the game
	Engine.time_scale = 0.1 
	
	
func exit() -> void:
	#Slowly go back to normal time
	var tween = create_tween() as Tween
	tween.tween_property(Engine, "time_scale", 1.0, 0.4)
	#Engine.time_scale = 1.0

func process_input(event: InputEvent) -> State:
	#Change to a hotkey later
	if Input.is_action_just_pressed('bulletTime'):
		return move_state
		
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
