extends Node

onready var current_level = $FirstScene

func _ready() -> void:
	current_level.connect("level_changed", self,"handle_level_changed")
	print("Level Ready")
	
func handle_level_changed(current_level_name: String):
	var next_level
	var next_level_name: String
	
	match current_level_name:
		"FirstScene": #change to drag and drop method so names aren't hard coded
			next_level_name = "SecondScene"
		"SecondScene":
			next_level_name = "FirstScene"
		_:
			return

	next_level = load("res://change_scenes/" + next_level_name + "Level.tscn").instance()
	add_child(next_level)
	next_level.connect("level_changed", self,"handle_level_changed")
	current_level.queue_free()
	current_level = next_level
