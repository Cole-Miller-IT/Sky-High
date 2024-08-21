extends CanvasLayer

#@export variables are assigned in the editor
@export var hpUpgrade: healthUpgrade
@export var bulletTimeUpgrade: btUpgrade
@export var goldGainUp: goldGainUpgrade
@onready var players = get_tree().get_nodes_in_group("players")

func _on_button_pressed():
	applyPowerUp(1)


func _on_button_2_pressed():
	applyPowerUp(2)


func _on_button_3_pressed():
	applyPowerUp(3)

func applyPowerUp(value):
	#print("Choosen power up was " + str(value))
	
	#Only one player, but would apply upgrade to all players
	for player in players:
		#print(player)
		#Update the player's info. For now just have 3 static player upgrades that change the player's data
		if value == 1:
			hpUpgrade.applyUpgrade(player)
			
		elif value == 2:
			bulletTimeUpgrade.applyUpgrade(player)
			
		else:
			goldGainUp.applyUpgrade(player)
	
	#disable the overlay
	self.visible = false
	
	#unpause the game
	get_tree().paused = false
