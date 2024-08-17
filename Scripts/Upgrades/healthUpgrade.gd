class_name healthUpgrade
extends "res://Scripts/Upgrades/baseUpgrade.gd"


func applyUpgrade(player: Player):
	player.health += 1
	print("player health is ")
	print(player.health)
