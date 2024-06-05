extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_master_value_changed(value):
	print("master sound now at ", value)


func _on_music_value_changed(value):
	pass # Replace with function body.


func _on_vfx_value_changed(value):
	pass # Replace with function body.
