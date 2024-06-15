extends State

@export var move_state: State
@export var die_state: State

var BTSprite = null
var BTFade = null
var moveOrders = []
var baseDashAmount = 50
var dashModifier = 1 #i.e. if 2 lefts are made combine them into a big, single dash

func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	print("In bulletTime Move state")

	BTSprite = parent.get_node("BulletTimeSprite")
	#show a visual indicator of where the player will end up
	BTSprite.visible = true
	
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
	if Input.is_action_just_pressed('die'):
		return die_state
		
	if Input.is_action_just_pressed('bulletTime'):
		return move_state
		
	if Input.is_action_just_pressed("confirmBulletTime"):
		print("execute bullet time orders")
		#execute the orders the player has queued up
		var result = executeOrders()
		
		#if false keep player in bulletTime, clear list or show what caused them to give the error. i.e. out of bounds with move 3
		print("result of bullet Time")
		print(result)
			
		return move_state
	
	if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right") or Input.is_action_just_pressed("up") or Input.is_action_just_pressed("down"):
		if parent.bulletTimeCharges <= 0:
			print("out of bullet time charges")
			
		else:
			if Input.is_action_just_pressed("left"):
				BTSprite.position.y += -50 #offset sprite. y cause the player sprites is rotated 90 degrees
				moveOrders.append(["left", 1]) #store the order for later
				
			if Input.is_action_just_pressed("right"):
				BTSprite.position.y += 50 #offset sprite. y cause the player sprites is rotated 90 degrees
				moveOrders.append(["right", 1]) #store the order for later
			
			if Input.is_action_just_pressed("up"):
				BTSprite.position.x += 50 #offset sprite. y cause the player sprites is rotated 90 degrees
				moveOrders.append(["up", 1]) #store the order for later
			
			if Input.is_action_just_pressed("down"):
				BTSprite.position.x += -50 #offset sprite. y cause the player sprites is rotated 90 degrees
				moveOrders.append(["down", 1]) #store the order for later
			
			#combine like orders together first i.e. two lefts make a bigger dash/blink distance
			if len(moveOrders) > 1:
				combineOrders()
			
			#update the UI and player charge counter
			parent.bulletTimeCharges += -1
			parent.updatePlayerBTBar.emit(parent.bulletTimeCharges)
		
	return null

func process_frame(delta: float) -> State:
	BTFade.global_position = parent.global_position
	BTFade.position = parent.position - BTFade.size / 2
	BTFade.rotation = 0
	
	return null

func process_physics(delta: float) -> State:
	return null
	
		
func executeOrders() -> bool:
	var newPos = Vector2(0,0)
	var direction = null
	var targetPos = BTSprite.global_position
	var dashAmount = 1
	
	for order in moveOrders:
		dashModifier = order[1]
		dashAmount = baseDashAmount * dashModifier
		if order[0] == "left":
			direction = (targetPos - parent.global_position).normalized()
			newPos = direction * dashAmount
			
		if order[0]  == "right":
			direction = (targetPos - parent.global_position).normalized()
			newPos = direction * dashAmount
			
		if order[0]  == "up":
			direction = (targetPos - parent.global_position).normalized()
			newPos = direction * dashAmount
			
		if order[0]  == "down":
			direction = (targetPos - parent.global_position).normalized()
			newPos = direction * dashAmount
			
		#Check out of bounds around here
		#newPos = parent.position + newPos
		#if newPos out of bounds:
			#return false
			
		#print(parent.position)
		parent.position += newPos
		#print("after")
		#print(parent.position)
		
	return true
			
func combineOrders():
	print("before combining")	
	print(moveOrders)
	var prevOrder = null
	var index = 0
	for currentOrder in moveOrders:
		if prevOrder == null:
			prevOrder = currentOrder
			index += 1
			
		else:
			#at the second order or greater
			if currentOrder[0] == prevOrder[0]:
				#combine the dash modifiers into one order
				moveOrders[index - 1][1] = currentOrder[1] + prevOrder[1]
				
				#remove the other orders from the array
				moveOrders.remove_at(index)
				
				#don't increment the index b/c we removed a value
				
			else:
				prevOrder = currentOrder
				index += 1
				
		
	print("after combining")	
	print(moveOrders)

