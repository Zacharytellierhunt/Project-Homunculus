extends Node

onready var current_level = $"First Scene"

func _ready() -> void:
	$"First Scene".connect("level_changed", self,"handle_level_changed")
	
func handle_level_changed(current_level_name: String):
	var next_level
	var next_level_name: String
	
	
	match current_level_name:
		"First":
			next_level = "Second"
		"Second":
			next_level = "First"
		_:
			return

	next_level = load("res://change_scenes/" + next_level_name + "Level.tscn")
