class_name goldGainUpgrade
extends "res://Resources/Upgrades/baseUpgrade.gd"


func applyUpgrade(player: Player):
	player.goldGain += 0.05
	#print("player gold gain is now")
	#print(player.goldGain)
