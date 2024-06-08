extends Label

@onready var curMoveState = get_parent().get_node("MovementStateMachine")

@onready var actionState = get_parent().get_node("ActionStateMachine")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(curMoveState)
	#print(actionState)
	self.text = "move state: %s\naction state: %s" %[curMoveState.current_state.name, actionState.current_state.name]
