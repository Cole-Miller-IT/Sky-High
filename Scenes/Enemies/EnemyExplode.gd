extends BaseEnemy



#Only players should be detected by this 
func _on_detection_range_area_entered(area):
	#print("arm explosive")
	#print(area)
	
	$DetectionRange.scale = Vector2(2, 2)
	$ExplosionRadius.visible = true
	$Timer.start()

func _on_timer_timeout():
	#print("explode now")
	
	#if player in range, deal damage
	for area in $DetectionRange.get_overlapping_areas():
		print(area)
		print("player still in area")
		
		#deal damage to the player
		$HitBox.damage = 10
		player.take_damage($HitBox.damage)
	
	#die
	queue_free()
