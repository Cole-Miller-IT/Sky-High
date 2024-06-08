class_name Bullet
extends Node2D

@onready var sprite = $Sprite2D as Sprite2D
@onready var notifier = $VisibleOnScreenNotifier2D as VisibleOnScreenEnabler2D
@onready var deathTimer = $Death as Timer
@onready var hitDetector = $HitDetector as Area2D


var direction: Vector2 = Vector2.ZERO
var speed : float = 150.0

func _ready():
	set_as_top_level(true) #Make the bullet move independant of it's parent (i.e. the player)
	
	look_at(position + direction)
	
	hitDetector.connect("body_entered", Callable(self, "_on_hit"))
	

func _on_hit(_body: Node) -> void:
	print("hit something")
	queue_free()


func _physics_process(delta):
	#print(position)
	position += (direction * speed) * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	deathTimer.start(0.8)


func _on_death_timeout():
	queue_free()
