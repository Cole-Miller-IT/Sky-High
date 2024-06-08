extends Area2D
class_name HurtBox

func _ready():
	connect("area_entered", Callable(self, "_on_area_entered"))


func _on_area_entered(hitbox: HitBox):
	#print("hitbox")
	if owner.has_method("take_damage"):
		#print("take damage")
		owner.take_damage(hitbox.damage)
