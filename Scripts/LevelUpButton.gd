extends CanvasLayer


func _on_button_pressed():
	applyPowerUp(1)


func _on_button_2_pressed():
	applyPowerUp(2)


func _on_button_3_pressed():
	applyPowerUp(3)

func applyPowerUp(value):
	print("Choosen power up was " + str(value))
	
	#Update the player's info
	
	
	
	
	#disable the overlay
	self.visible = false
	
	#unpause the game
	get_tree().paused = false
