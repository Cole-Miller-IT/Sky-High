class_name Bullet
extends CharacterBody2D

@onready var sprite = $Sprite2D as Sprite2D
@onready var notifier = $VisibleOnScreenNotifier2D as VisibleOnScreenEnabler2D
@onready var deathTimer = $Death as Timer

#var direction: Vector2 = Vector2.RIGHT
var direction: Vector2 = Vector2.RIGHT
var speed : float = 1.0

func rotateSprite(target: Vector2):
	self.look_at(target)


func _physics_process(delta):
	move(delta)


func move(delta : float) -> void:
	move_and_collide((direction * speed) * delta)


func _on_visible_on_screen_notifier_2d_screen_exited():
	deathTimer.start(0.8)


func _on_death_timeout():
	queue_free()
