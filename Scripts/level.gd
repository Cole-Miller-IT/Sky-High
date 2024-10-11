extends WorldEnvironment

func _ready():
	$Player.playerDied.connect(player_died)
	$PauseOverlay.visible = false
	

func player_died():
	print("player died")
	$PauseOverlay.visible = true
	$PauseOverlay/VBoxContainer/Resume.visible = false
	get_tree().paused = true


func _on_player_level_up(value):
	#print("Level caught player level up signal")
	#print(value)
	$"UI/Player UI Bar/LevelCounter".text = str(value)
	
	#show the overlay and available choices 
	$"UI/Player UI Bar/LevelOverlay".visible = true
	
	#pause the game
	get_tree().paused = true
	

func _on_player_pause_menu_key_pressed():
	$PauseOverlay.visible = true
	get_tree().paused = true
