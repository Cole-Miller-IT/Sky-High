extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade")


func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
