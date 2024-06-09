class_name Player
extends CharacterBody2D

signal playerDied

@onready var trackingHandler = $TrackingHandler as TrackingHandler

#State machines
@onready var movementStateMachine = $MovementStateMachine
@onready var actionStateMachine = $ActionStateMachine

#Shared data for the state machines
var canAttack = true


#player info
var health = 10

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	movementStateMachine.init(self)
	actionStateMachine.init(self)
	
	$HealthBar.init_health(health)

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
