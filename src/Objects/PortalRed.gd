tool
extends Area2D

var RED_TYPE = 1 # TODO: add to actor class





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






func _on_ColourChecker_body_entered(body) -> void:
	if _playerType() == RED_TYPE:
		queue_free()
		return


func _playerType() -> int:
	return get_node("../Player").get("playerType") as int
