extends CharacterBody2D


const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionHorizontal = Input.get_axis("left", "right")
	if directionHorizontal:
		velocity.x = directionHorizontal * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var directionVertical = Input.get_axis("up", "down")
	if directionVertical:
		velocity.y = directionVertical * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
