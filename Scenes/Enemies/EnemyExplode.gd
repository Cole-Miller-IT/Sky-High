extends BaseEnemy



#Only players should be detected by this 
func _on_detection_range_area_entered(area):
	print("area detected: " + str(area))
	#print("arm explosive")
	
	$DetectionRange.scale = Vector2(2, 2)
	$ExplosionRadius.visible = true
	$Timer.start()

func _on_timer_timeout():
	#print("explode now")
	
	#if player in range, deal damage
	for area in $DetectionRange.get_overlapping_areas():
		print(str(area) + " still in area")
		
		#deal damage to the player
		$HitBox.damage = 10
		player.take_damage($HitBox.damage)
	
	die()
	
func die():
	#print("enemy die now")
	
	#Bug: orb triggers explode timer of other explode enemies. Figure this out later, disable for now
	
	#spawn xp orb pickup
	#var instance = xpOrb.instantiate()
	#instance.global_position = self.global_position
	#add it to the level node
	#get_parent().add_child(instance)
	
	queue_free()
