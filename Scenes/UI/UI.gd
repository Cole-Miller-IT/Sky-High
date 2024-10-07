extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_update_player_health(value):
	#print("player health update")
	#print(value)
	$"Player UI Bar/HealthBar"._set_health(value)


func _on_player_init_player_health(value):
	#print("init player health")
	#print(value)
	$"Player UI Bar/HealthBar".init_health(value)


func _on_player_init_player_bt_bar(value):
	$"Player UI Bar/BulletTimeBar".init_health(value)


func _on_player_update_player_bt_bar(value):
	$"Player UI Bar/BulletTimeBar"._set_health(value)
	

func _on_player_update_xp_bar(value):
	$"Player UI Bar/ExperienceBar"._set_XP(value)
