extends State


@export
var idle_state: State

func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	print("In move state")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('up'):
		return idle_state
		
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var SPEED = 100
	var directionHorizontal = Input.get_axis("left", "right")
	if directionHorizontal:
		parent.velocity.x = directionHorizontal * SPEED
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, SPEED)
		
	var directionVertical = Input.get_axis("up", "down")
	if directionVertical:
		parent.velocity.y = directionVertical * SPEED
	else:
		parent.velocity.y = move_toward(parent.velocity.y, 0, SPEED)

	parent.move_and_slide()
	
	#parent.velocity.y += gravity * delta
	
	#var movement = Input.get_axis('move_left', 'move_right') * move_speed
	
	if parent.velocity.x == 0 and parent.velocity.y == 0:
		return idle_state
	
	return null
	
