extends Node2D

@onready var target = null
@onready var direction = null

var speed = 50
var speedModifier = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_process(false)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#look at the player
	#$TrackingHandler.trackCharacter(self, target)
	
	#move towards the player
	direction = (target.global_position - self.global_position).normalized()
	#print(direction)
	self.position += ((direction * speed) * speedModifier) * delta
	#print(position)



func _on_hitbox_area_entered(area):
	#should't need this becasue the player is on their own layer
	#if area.owner == Player:
	
	print("xp body hit")
	#queue_free()


func _on_player_detection_radius_area_entered(area):
	if area.owner is Player:
		print("found a player")
		print(area.owner)
		target = area.owner
		self.set_process(true)


func _on_player_detection_radius_area_exited(area):
	if area.owner is Player:
		print("player left xp radius")
		target = null
		self.set_process(false)
