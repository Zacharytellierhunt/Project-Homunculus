tool
extends Area2D

# TODO: impliment the same functionality that the enemy class has


const Colours = preload("res://src/Actors/Constants.gd").Colours


export var doorType = 0


func _ready() -> void:
	return

func _on_ColourChecker_body_entered(_body: PhysicsBody2D) -> void:
	print(_playerType())
	if _playerType() == Colours.RED_TYPE:
		queue_free()
	return



func _playerType() -> int:
	return get_node("../Player").get("playerType") as int
