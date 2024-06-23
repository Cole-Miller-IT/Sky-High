extends HurtBox


func _ready():
	connect("area_entered", Callable(self, "_on_area_entered")) #not working maybe


func _on_area_entered(hitbox: HitBox):
	print("hitbox")
	print(hitbox)
	if owner.has_method("gain_xp"):
		print("gain xp")
		owner.gain_xp(self.xpAmount)
