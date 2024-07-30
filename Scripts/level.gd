extends WorldEnvironment

func _ready():
	$Player.playerDied.connect(player_died)
	

func player_died():
	print("player died")
	get_tree().paused = true


func _on_player_level_up():
	print("Level caught player level up signal")
	
	#pause the game
	get_tree().paused = true
	
	#show the overlay and available choices 
	$"UI/Player UI Bar/LevelUpFade/PowerUpsContainer".visible = true
