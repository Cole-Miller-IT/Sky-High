extends Node2D

@export var spawns:Array[Resource] = []
#in the editor to the right
#add an element
#give it a spawnInfo custom resource with the spawn info script
#click on the new element and give it the parameters you want

var time = 0

@onready var player = get_tree().get_first_node_in_group("players")


func _on_timer_timeout():
	#print("spawn an enemy now")
	time += 1
	
	if time > 60:
		print("wave over end now. need to implement")
		
	var enemySpawns = spawns
	for spawn in enemySpawns:
		if time >= spawn.timeStart and time <= spawn.timeEnd:
			var newEnemy = load(str(spawn.enemy.resource_path))
			var counter = 0
			while counter < spawn.enemySpawnAmount:
				var enemySpawn = newEnemy.instantiate()
				enemySpawn.global_position = getRandomPosition()
				add_child(enemySpawn)
				counter += 1
		
#Get a random position just outside of the screen of where the player currently is
func getRandomPosition():
	var vpr = get_viewport_rect().size * randf_range(1.1,1.2)
	
	var top_left = Vector2(player.global_position.x - vpr.x/2, player.global_position.y - vpr.y/2)
	var top_right = Vector2(player.global_position.x + vpr.x/2, player.global_position.y - vpr.y/2)
	var bottom_left = Vector2(player.global_position.x - vpr.x/2, player.global_position.y + vpr.y/2)
	var bottom_right = Vector2(player.global_position.x + vpr.x/2, player.global_position.y + vpr.y/2)
	var pos_side = ["up","down","right","left"].pick_random()
	
	var spawn_pos1 = Vector2.ZERO
	var spawn_pos2 = Vector2.ZERO
	
	match pos_side:
		"up":
			spawn_pos1 = top_left
			spawn_pos2 = top_right
		"down":
			spawn_pos1 = bottom_left
			spawn_pos2 = bottom_right
		"right":
			spawn_pos1 = top_right
			spawn_pos2 = bottom_right
		"left":
			spawn_pos1 = top_left
			spawn_pos2 = bottom_left
	
	var x_spawn = randf_range(spawn_pos1.x, spawn_pos2.x)
	var y_spawn = randf_range(spawn_pos1.y,spawn_pos2.y)
	return Vector2(x_spawn,y_spawn)
