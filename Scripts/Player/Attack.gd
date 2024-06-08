extends State

@onready var bullet = preload("res://Scenes/Bullet/bullet.tscn")

@export var idle_action_state: State

func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	print("In attack state")
	
	#process the first action that got the player in this state
	attack()

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed("lightAttack") or Input.is_action_just_pressed("lightAttack"):
		attack()
			
		return null
		
	else:
		return idle_action_state

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
	
func attack():
	if parent.canAttack == true:
		print("shot fired")
		
		#Create a bullet to fire
		var bulletInstance = bullet.instantiate() as Bullet
		
		#Update the variables so it shoots out of the player
		#Normalize to prevent the bullet from moving faster or slower based on where the mouse is
		var targetPos = (parent.get_global_mouse_position() - parent.global_position).normalized() 
		bulletInstance.direction = targetPos 
		bulletInstance.rotateSprite()
		bulletInstance.position = Vector2(parent.position.x, parent.position.y)
		
		#gets added to the player node. could change later to the level node
		add_child(bulletInstance)
			
		parent.canAttack = false
		$AttackRate.start()
		
func _on_attack_rate_timeout():
	parent.canAttack = true
