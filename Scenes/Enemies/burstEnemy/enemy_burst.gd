extends BaseEnemy
class_name BurstEnemy

var shotDamage = 5
var shotDamageMultiplier = 1
var burst = 3


func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	#velocity = direction * movementSpeed
	
	#face the player
	self.look_at(player.get_global_position())
	
	#Do not move towards the player
	#move_and_slide()

func attack(value):
	print("------------enemy attack now-----------")
	var damagePerShot = value * shotDamageMultiplier
	
	for i in range(burst):
		print("new bullet")
		#instance a bullet
		#var newBullet = bullet.instance()
		
		#assign properties or use a resource
		
		#point it towards the player
		#newBullet.look_at(player.get_global_position())
		
		#Assign it a way to die


func _on_attack_cooldown_timeout():
	#shoot a 3 round burst at the player
	attack(shotDamage)
	
	$AttackCooldown.start()
