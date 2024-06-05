extends CanvasLayer


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_master_value_changed(value):
	#print("master sound now at ", value)
	if value == -45:
		AudioServer.set_bus_mute(0, true)
		
	else:
		AudioServer.set_bus_mute(0, false)
		
	AudioServer.set_bus_volume_db(0, value)


func _on_music_value_changed(value):
	if value == -45:
		AudioServer.set_bus_mute(1, true)
		
	else:
		AudioServer.set_bus_mute(1, false)
		
	AudioServer.set_bus_volume_db(1, value)


func _on_vfx_value_changed(value):
	if value == -45:
		AudioServer.set_bus_mute(2, true)
		
	else:
		AudioServer.set_bus_mute(2, false)
		
	AudioServer.set_bus_volume_db(2, value)


func _on_test_music_pressed():
	$SoundSliders/Music/TestMusic/MusicTest.play()


func _on_test_vfx_pressed():
	$SoundSliders/VFX/TestVFX/VFXTest.play()
