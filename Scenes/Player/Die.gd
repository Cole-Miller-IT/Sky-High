extends State

signal playerDied

func enter() -> void:
	#play any death animations, sounds, or effects
	print("in die state")
	$DeathSound.play()
	$DeathEffect.position = parent.global_position
	$DeathEffect.emitting = true
	await $DeathSound.finished
	
	#emit any signals
	playerDied.emit()
	
	#destroy the node
	queue_free()
	

func exit() -> void:
	pass
