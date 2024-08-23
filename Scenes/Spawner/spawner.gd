extends Node2D

@export var spawns:Array[Resource] = []
#in the editor to the right
#add an element
#give it a spawnInfo custom resource with the spawn info script
#click on the new element and give it the parameters you want

var time = 0

@onready var player = get_tree().get_first_node_in_group("player")


func _on_timer_timeout():
	print("spawn an enemy now")
