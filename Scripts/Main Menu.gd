extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuMusic.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_game_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	get_tree().change_scene_to_file("res://Scenes/level.tscn")


func _on_options_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	get_tree().change_scene_to_file("res://Scenes/options.tscn")


func _on_credits_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
	
	
func _on_quit_pressed():
	get_tree().free()
