extends ProgressBar


@onready var time = $Timer as Timer
@onready var useBar = $UseBar as ProgressBar

var health = 0 : set = _set_health


func _set_health(newHealth):
	var prevHealth = health
	health = min(max_value, newHealth)
	value = health
	
	if health <= 0:
		print("out of uses")
		#emit some signal here to notify the player
		
	if health < prevHealth:
		$Timer.start()
		
	else:
		useBar.value = health
	
func init_health(startingHealth):
	health = startingHealth
	max_value = health
	value = health
	useBar.max_value = health
	useBar.value = health

func _on_timer_timeout():
	useBar.value = health
