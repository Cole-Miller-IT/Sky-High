extends State


@export
var idle_state: State

var SPEED = 100

func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	print("In move state")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	#Change later to just the movement keys
	if (Input.is_anything_pressed() == false):
		return idle_state
	
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	# Get the input direction and handle the movement/deceleration.
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
	
	return null
	
