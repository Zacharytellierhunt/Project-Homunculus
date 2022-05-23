extends "res://src/Actors/Actor.gd"
class_name Enemy

var _enemyType
export var NULL_TYPE = 0 # TODO: add to actor class
export var RED_TYPE = 1 # TODO: add to actor class
export var BLUE_TYPE = 2 # TODO: add to actor class

func _init(enemyType: int) -> void:
	self._enemyType = enemyType
	return

#starts instance going left towards the player
func _ready() -> void: # TODO: add to new enemy class
	set_physics_process(false)
	_velocity.x = -speed.x


#hitbox for detecting the player jumping on them, checks player colour 
func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	
	if _playerType() == NULL_TYPE || _playerType() == BLUE_TYPE:
		if _didPlayerJumpEnemy(body):
			_changePlayerType(RED_TYPE)
			queue_free()
			return

#hitbox for floor and wall collision as well as gravity
func _physics_process(delta: float) -> void: # TODO: add to new enemy class
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

func _playerType() -> int:
	return get_node("../Player").get("playerType") as int


#set playerType, print playerType
func _changePlayerType(newType: int) -> void: # TODO: add to new enemy class
	get_node("../Player").set("playerType", newType)
	print(get_node("../Player").get("playerType"))
	return


#checks if the player jumps on the enemy
func _didPlayerJumpEnemy(body: PhysicsBody2D) -> bool: # TODO: add to new enemy class
	return body.global_position.y < get_node("StompDetector").global_position.y
