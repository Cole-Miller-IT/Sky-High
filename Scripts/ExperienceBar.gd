extends TextureProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	value = 0
	

func _set_XP(xpCur):
	#print("updating xp bar")
	#update the visual progress bar
	value = xpCur
	
	#check if the player reached a new level
