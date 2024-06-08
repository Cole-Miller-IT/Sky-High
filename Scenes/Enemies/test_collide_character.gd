extends CharacterBody2D

var health = 200

func _ready():
	$HealthBar.init_health(health)

func take_damage(value):
	#print("enemy take damage")
	#print(value)
	health -= value
	$HealthBar._set_health(health)
	
	print(health)
	if health <= 0:
		queue_free()
