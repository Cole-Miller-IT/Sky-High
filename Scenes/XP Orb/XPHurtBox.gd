extends HurtBox

signal gainXP
#func _ready():
	#connect("area_entered", Callable(self, "_on_area_entered")) #not working maybe


func _on_area_entered(hitbox: HitBox):
	#print("hitbox")
	#print(hitbox)
	
	emit_signal("gainXP")
