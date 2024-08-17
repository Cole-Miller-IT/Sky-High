extends CanvasLayer


@onready var healthUpgrade = load("res://Scripts/Upgrades/healthUpgrade.gd")
@onready var btUpgrade = load("res://Scripts/Upgrades/btChargeUpgrade.gd")
@onready var goldGainUpgrade = load("res://Scripts/Upgrades/healthUpgrade.gd")

@onready var players = get_tree().get_nodes_in_group("players")

func _on_button_pressed():
	applyPowerUp(1)


func _on_button_2_pressed():
	applyPowerUp(2)


func _on_button_3_pressed():
	applyPowerUp(3)

func applyPowerUp(value):
	print("Choosen power up was " + str(value))
	
	#Only one player, but would apply upgrade to all players
	for player in players:
		print(player)
		#Update the player's info. For now just have 3 static player upgrades that change the player's data
		if value == 1:
			healthUpgrade.applyUpgrade(player)
			print("upgrade 1")
			
		elif value == 2:
			btUpgrade.applyUpgrade(player)
			
		else:
			goldGainUpgrade.applyUpgrade(player)
	
	
	#disable the overlay
	self.visible = false
	
	#unpause the game
	get_tree().paused = false
