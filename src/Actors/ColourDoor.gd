tool
extends Area2D

# TODO: impliment the same functionality that the enemy class has


const Colours = preload("res://src/Actors/Constants.gd").Colours

const openRules = preload("res://src/Utilities/Rules.gd").openRules

const playerType = preload("res://src/Actors/Player.gd")

#var player = preload("res://src/Actors/Player.gd")

export onready var anim_player: AnimationPlayer = $AnimationPlayer 

export var doorType = 0


func _ready() -> void:
	door_Colour_Change(doorType)
	print("door playertype check", playerType.playerType)
	return


func _on_ColourChecker_body_entered(_body: PhysicsBody2D) -> void:
	if canOpen(_playerType(), doorType):
#		print(_playerType())
		queue_free()
	return

func canOpen (playerType: int, doorType: int ) -> bool:
	print("Player(", playerType, ") can open: [", openRules[playerType], "] \tDoor is (", doorType ,")")
	print("\tCan open? ", doorType in openRules[playerType])
	return doorType in openRules[playerType]

#plays specific enemy animation based on ememyType colour
func door_Colour_Change(colour: int ) -> void:
	if colour == Colours.RED_TYPE:
		_doorColourAnim("change_To_Red")
	if colour == Colours.GREEN_TYPE:
		_doorColourAnim("change_To_Green")
	if colour == Colours.BLUE_TYPE:
		_doorColourAnim("change_To_Blue")


#plays enemy colour animation based on the parameter
func _doorColourAnim(anim: String) -> void:
	anim_player.play(anim)

#gets playerType value from Player Node
func _playerType() -> int:
	return get_node("../Player").get("playerType") as int
