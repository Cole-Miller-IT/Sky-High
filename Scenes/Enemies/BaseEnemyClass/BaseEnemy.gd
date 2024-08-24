extends CharacterBody2D
class_name BaseEnemy

@onready var player = get_tree().get_first_node_in_group("players")

var health = 20
var movementSpeed = 60


func _ready():
	$HitBox.damage = 20
	
#move()
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movementSpeed
	move_and_slide()

func take_damage(value):
	#print(value)
	health -= value
	
	#print(health)
	if health <= 0:
		die()
		

func attack(value):
	print("enemy attack now")
	
func die():
	print("enemy die now")
	queue_free()
