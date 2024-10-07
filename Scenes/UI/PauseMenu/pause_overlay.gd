extends CanvasLayer


func _on_resume_pressed():
	#hide overlay again
	self.visible = false
	
	#unpause the game
	get_tree().paused = false


func _on_settings_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	print("Show settings menu, not implemented")


func _on_main_menu_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_restart_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	get_tree().change_scene_to_file("res://Scenes/level.tscn")
