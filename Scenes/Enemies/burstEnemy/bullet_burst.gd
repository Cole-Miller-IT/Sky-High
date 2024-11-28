extends Node2D
class_name BulletBurst

@onready var hitDetector = $HitDetector as Area2D

var speed : float = 150.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$HitBox.damage = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += transform.x * speed * delta
	

func _on_lifetime_timeout():
	queue_free()


func _on_hit_detector_area_entered(area):
	print("hit something")
	queue_free()
