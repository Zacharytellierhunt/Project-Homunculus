tool
extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer #get_node("AnimationPlayer")

export var next_scene: PackedScene


func _on_body_entered(_body: PhysicsBody2D) -> void:
	#teleport()
	get_node("../Player/TimerLabel")._timer_off()
	get_node("../Player/TimerLabel")._save_time()
	return


func _get_configuration_warning() -> String:
	return "The next scene property can't be empty" if not next_scene else ""


func teleport() -> void:
	anim_player.play("fade_to_black")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)
