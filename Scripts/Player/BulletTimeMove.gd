extends State

@export var move_state: State

var BTSprite = null
var BTFade = null
var moveOrders = []
var dashAmount = 50

func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	print("In bulletTime Move state")

	BTSprite = parent.get_node("BulletTimeSprite")
	
	BTFade = parent.get_node("CanvasLayer/BTFade")
	BTFade.visible = true

	#slow down the game
	Engine.time_scale = 0.1 
	
	
func exit() -> void:
	BTSprite.visible = false
	BTSprite.position = parent.position - parent.global_position
	
	BTFade.visible = false
	BTFade.global_position = parent.global_position
	BTFade.position = parent.position - BTFade.size / 2 #Center on the player
	
	moveOrders.clear()
	
	#Slowly go back to normal time
	var tween = create_tween() as Tween
	tween.tween_property(Engine, "time_scale", 1.0, 0.4)
	#Engine.time_scale = 1.0

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('bulletTime'):
		return move_state
		
	if Input.is_action_just_pressed("confirmBulletTime"):
		print("execute bullet time orders")
		#execute the orders the player has queued up
		executeOrders()
			
		return move_state
	
	if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right") or Input.is_action_just_pressed("up") or Input.is_action_just_pressed("down"):
		#show a visual indicator of where the player will end up
		BTSprite.visible = true
		
		if Input.is_action_just_pressed("left"):
			BTSprite.position.y += -50 #offset sprite. y cause the player sprites is rotated 90 degrees
			moveOrders.append("left") #store the order for later
			
		if Input.is_action_just_pressed("right"):
			BTSprite.position.y += 50 #offset sprite. y cause the player sprites is rotated 90 degrees
			moveOrders.append("right") #store the order for later
		
		if Input.is_action_just_pressed("up"):
			BTSprite.position.x += 50 #offset sprite. y cause the player sprites is rotated 90 degrees
			moveOrders.append("up") #store the order for later
		
		if Input.is_action_just_pressed("down"):
			BTSprite.position.x += -50 #offset sprite. y cause the player sprites is rotated 90 degrees
			moveOrders.append("down") #store the order for later
		
		#combine like orders together first i.e. two lefts make a bigger dash/blink distance
		combineOrders()
		
	return null

func process_frame(delta: float) -> State:
	BTFade.global_position = parent.global_position
	BTFade.position = parent.position - BTFade.size / 2
	BTFade.rotation = 0
	
	return null

func process_physics(delta: float) -> State:
	return null
	
		
func executeOrders():
	var newPos = Vector2(0,0)
	for order in moveOrders:
		print(order)
		#Check out of bounds around here
		
		
		if order == "left":
			newPos += Vector2(-dashAmount, 0) #change these
			
		if order == "right":
			newPos += Vector2(dashAmount, 0)
			
		if order == "up":
			newPos += Vector2(0, -dashAmount)
			
		if order == "down":
			newPos += Vector2(0, dashAmount)
			
	print(newPos)
	parent.position += newPos
			
func combineOrders():
	pass	

