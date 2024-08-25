extends BaseEnemy

#move()
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movementSpeed
	
	#face the player
	#characterBody.look_at(trackedTarget.get_global_position())
	self.look_at(player.get_global_position())
	
	move_and_slide()
