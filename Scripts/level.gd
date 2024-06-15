extends WorldEnvironment

func _ready():
	$Player.playerDied.connect(player_died)
	

func player_died():
	print("player died")
	get_tree().paused = true
