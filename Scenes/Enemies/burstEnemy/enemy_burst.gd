extends BaseEnemy
class_name BurstEnemy

var shotDamage = 5
var shotDamageMultiplier = 1
var burst = 3
var bullet = preload('res://Scenes/Enemies/burstEnemy/bullet_burst.tscn')

func _physics_process(delta): 
	var direction = global_position.direction_to(player.global_position)
	#velocity = direction * movementSpeed
	
	#face the player
	self.look_at(player.get_global_position())
	
	#Do not move towards the player
	#move_and_slide()

func attack(value):
	print("------------enemy attack now-----------")
	#var damagePerShot = value * shotDamageMultiplier
	
	for i in range(burst):
		var newBullet = bullet.instantiate()
		owner.add_child(newBullet)
		
		#
		newBullet.transform = $Muzzle.global_transform
		
		#wait 0.1 seconds before next shot
		await get_tree().create_timer(0.1).timeout
	
func _on_attack_cooldown_timeout():
	#shoot a 3 round burst at the player
	attack(shotDamage)
	
	$AttackCooldown.start()
