extends "res://src/Actors/Actor.gd"

# TODO: make 4 enemy types with non-changeable colours that inherit from this class
#		to make it easier to use the level editor

const Colours = preload("res://src/Actors/Constants.gd").Colours

const killingRules = preload("res://src/Utilities/Rules.gd").killingRules

export var enemyType = 0

export var verticalRange = 15

export onready var anim_player: AnimationPlayer = $AnimationPlayer 

func _get_configuration_warning() -> String:
	return "Null = 0, Red = 1, Yellow = 2, Blue = 3" if enemyType == Colours.NULL_TYPE else ""

#starts instance going left towards the player
func _ready() -> void:
	print(Colours)
	set_physics_process(false)
	_velocity.x = -speed.x
	print("enemy type: ", enemyType)
	enemy_Colour_Change(enemyType)


#hitbox for detecting the player jumping on them, checks player colour 
func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	# TODO: turn off enemy hitbox when it dies, so it doesn't kill the player.
	print("\nJumped on enemy!", enemyType)
	if canKill(_playerType(), enemyType) && _didPlayerJumpEnemy(body):
		stompImpulse()
		queue_free()
		_changePlayerType(enemyType)
		playPlayerAnim(enemyType)
			
	else: 
		stompImpulse()

#kills player if it enters the kill hitboxes
func _on_Area2D_body_entered(_body: CollisionShape2D) -> void:
	get_node("../Player").queue_free()
	get_tree().reload_current_scene()

#checks if the enemy can be killed by the player
func canKill (playerType: int, enemyType: int ) -> bool:
	print("Player(", playerType, ") can kill: [", killingRules[playerType], "] \tEnemy is (", enemyType ,")")
	print("\tCan kill? ", enemyType in killingRules[playerType])
	return enemyType in killingRules[playerType]

#plays the player anims for colour changing
func playPlayerAnim(anim: int) -> void:
	get_node("../Player").player_Colour_Change(anim)


#plays specific enemy animation based on ememyType colour
func enemy_Colour_Change(colour: int ) -> void:
	if colour == Colours.NULL_TYPE:
		_enemyColourAnim("change_To_Null")
	if colour == Colours.RED_TYPE:
		_enemyColourAnim("change_To_Red")
	if colour == Colours.YELLOW_TYPE:
		_enemyColourAnim("change_To_Yellow")
	if colour == Colours.BLUE_TYPE:
		_enemyColourAnim("change_To_Blue")


#plays enemy colour animation based on the parameter
func _enemyColourAnim(anim: String) -> void:
	anim_player.play(anim)


#gets Player stompImpulse function
func stompImpulse() -> void:
	get_node("../Player").stompImpulse()


#hitbox for floor and wall collision as well as gravity
func _physics_process(delta: float) -> void: # TODO: add to new enemy class
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


#gets playerType value from Player Node
func _playerType() -> int:
	return get_node("../Player").get("playerType") as int


#set playerType, print playerType
func _changePlayerType(newType: int) -> void: # TODO: add to new enemy class
	get_node("../Player").set("playerType", newType)
	#print(get_node("../Player").get("playerType"))
	return


#checks if the player jumps on the enemy
func _didPlayerJumpEnemy(body: PhysicsBody2D) -> bool:
	
	var enemyHead_y = body.global_position.y
	var playerFeet_y = get_node("StompDetector").global_position.y
	
	var hitbox_y_min = enemyHead_y + verticalRange
	var hitbox_y_max = enemyHead_y - verticalRange
	var result = (playerFeet_y < hitbox_y_min) && (playerFeet_y > hitbox_y_max)
	
	print("Did player jump on enemy? ", result)
	print("\tenemyHead_y = ", enemyHead_y)
	print("\tplayerFeet_y = ", playerFeet_y)
	print("\t\thitbox_y_min = ", hitbox_y_min, "\thitbox_y_max = ", hitbox_y_max)
	return result
