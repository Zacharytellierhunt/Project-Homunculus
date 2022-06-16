extends Node

signal level_changed(level_name)

export (String) var level_name = "level" 


func _on_ButtonChangeScene_pressed():
	#get_tree().change_scene("res://SaveTutorial2.tscn")
	emit_signal("level_changed", level_name)