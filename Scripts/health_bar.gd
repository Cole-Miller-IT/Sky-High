extends ProgressBar


@onready var time = $Timer as Timer
@onready var damageBar = $DamageBar as ProgressBar

var health = 0 : set = _set_health


func _set_health(newHealth):
	var prevHealth = health
	health = min(max_value, newHealth)
	value = health
	
	if health <= 0:
		#queue_free()
		pass
		
	if health < prevHealth:
		$Timer.start()
		
	else:
		damageBar.value = health
	
func init_health(startingHealth):
	health = startingHealth
	max_value = health
	value = health
	damageBar.max_value = health
	damageBar.value = health

func _on_timer_timeout():
	damageBar.value = health
