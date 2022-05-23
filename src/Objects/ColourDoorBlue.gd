tool
extends Area2D

const Colours = preload("res://src/Actors/Constants.gd").Colours

func _ready() -> void:
	add_to_group("Door")
	return


func _on_ColourChecker_body_entered(_body: PhysicsBody2D) -> void:
	print(_playerType())
	if _playerType() == Colours.BLUE_TYPE:
		queue_free()
	return


func _playerType() -> int:
	return get_node("../Player").get("playerType") as int



#func _disableCollision () -> void:
#	get_node("ColourDoorRed").get("CollisionShape2D").set_deferred("disabled", true)
#	return
	
	
#onready var anim_player: AnimationPlayer = $AnimationPlayer #get_node("AnimationPlayer")

#export var next_scene: PackedScene


#func _on_body_entered(body: PhysicsBody2D) -> void:
#	teleport()

#func _get_configuration_warning() -> String:
#	return "The next scene property can't be empty" if not next_scene else ""


#func teleport() -> void:
#	anim_player.play("fade_to_black")
#	yield(anim_player, "animation_finished")
#	get_tree().change_scene_to(next_scene)





