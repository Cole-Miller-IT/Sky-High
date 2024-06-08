class_name TrackingHandler
extends Node2D


func trackMouse(characterBody : CharacterBody2D) -> void:
	characterBody.look_at(get_global_mouse_position())

func trackCharacter(characterBody : CharacterBody2D, trackedTarget : CharacterBody2D) -> void:
	characterBody.look_at(trackedTarget.get_global_position())
