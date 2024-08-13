extends WorldEnvironment

func _ready():
	$Player.playerDied.connect(player_died)
	

func player_died():
	print("player died")
	get_tree().paused = true


func _on_player_level_up(value):
	print("Level caught player level up signal")
	print(value)
	$"UI/Player UI Bar/LevelCounter".text = str(value)
	
	#Randomly choose three upgrades, from a pool of available upgrades
	
	
	#show the overlay and available choices 
	$"UI/Player UI Bar/LevelOverlay".visible = true
	
	#pause the game
	get_tree().paused = true
	
	
