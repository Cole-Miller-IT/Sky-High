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
		
		var instance = bullet.instantiate() as Bullet
		
		#var targetPos = parent.get_global_mouse_position()
		#instance.direction = Vector2.from_angle(parent.rotation)
		#var bullet_direction = Vector2.from_angle(parent.rotation)
		#instance.rotateSprite(targetPos)
		#instance.position = Vector2(parent.position.x + 48, parent.position.y)
		
		add_child(instance)
			
		parent.canAttack = false
		$AttackRate.start()
		
func _on_attack_rate_timeout():
	parent.canAttack = true
