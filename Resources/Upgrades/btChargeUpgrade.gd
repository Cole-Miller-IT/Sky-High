class_name btUpgrade
extends "res://Resources/Upgrades/baseUpgrade.gd"


func applyUpgrade(player: Player):
	player.bulletTimeCharges = 5
	print("player bt charges is ")
	print(player.bulletTimeCharges)
