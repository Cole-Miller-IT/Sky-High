class_name Player
extends CharacterBody2D

signal playerDied

#updating the UI bar
signal initPlayerHealth
signal updatePlayerHealth
signal initPlayerBTBar
signal updatePlayerBTBar
signal updateXPBar
signal levelUp

@onready var trackingHandler = $TrackingHandler as TrackingHandler

#State machines
@onready var movementStateMachine = $MovementStateMachine
@onready var actionStateMachine = $ActionStateMachine

#Shared data for the state machines
var canAttack = true


#player info
var health = 10
var bulletTimeCharges = 2
var goldGain = 1.00

var xpLevel = 1
var xpCur = 0
var xpLevelThreshold = 100 	#How much xp the player needs to level up
var xpLevelModifier = 1.1 	#How much more xp the players needs per level as a multiplier
var xpAmount = 100			#How much exp the player gains per orb

func _ready() -> void:
	add_to_group("players") #Used for upgrades
	
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	movementStateMachine.init(self)
	actionStateMachine.init(self)
	
	#Init the UI bars
	initPlayerHealth.emit(health)
	initPlayerBTBar.emit(bulletTimeCharges)

#pass the input/processing to the state machines
func _unhandled_input(event: InputEvent) -> void:
	movementStateMachine.process_input(event)
	actionStateMachine.process_input(event)

func _physics_process(delta: float) -> void:
	movementStateMachine.process_physics(delta)
	actionStateMachine.process_physics(delta)

func _process(delta: float) -> void:
	movementStateMachine.process_frame(delta)
	actionStateMachine.process_frame(delta)
	
	trackingHandler.trackMouse(self)


#pass up the signal from the die state
func _on_die_player_died():
	playerDied.emit()


func _on_update_player_health(value):
	#Apply the flash shader to the player for a brief time
	hurtFlash()
	
	
func hurtFlash():
	$Sprite2D.material.set_shader_parameter("flash_modifier", 0.7)
	$Sprite2D.material.set_shader_parameter("flash_color", Vector4(1, 0, 0, 1))
	$HurtFlashTimer.start()


func _on_hurt_flash_timer_timeout():
	$Sprite2D.material.set_shader_parameter("flash_modifier", 0.0)


func _on_xp_hurt_box_gain_xp():
	#print("gained " + str(xpAmount) + " xp")
	xpCur += xpAmount
	#print("current xp: " + str(xpCur))
	
	if xpCur >= xpLevelThreshold:
		#level up
		#print("level up")
		xpLevel += 1
		xpCur -= xpLevelThreshold
		
		#increase the new level threshold
		xpLevelThreshold = xpLevelThreshold * xpLevelModifier
		#print("new xp to level " + str(xpLevelThreshold))
		
		emit_signal("levelUp", xpLevel)
		
	emit_signal("updateXPBar", xpCur)
