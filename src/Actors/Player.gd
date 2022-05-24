extends Actor

const Colours = preload("res://src/Actors/Constants.gd").Colours

#playerType: 0 == null, 1 == Red, 2 == Blue
export var playerType = 0 
#Adjustable variable for making the player bounce when they stomp an enemy
export var stomp_impulse: = 250.0
#get_node("AnimationPlayer")
export onready var anim_player: AnimationPlayer = $AnimationPlayer 


#calls all functions when the game is ready
func _ready() -> void:
	print(playerType)
		


func player_Colour_Change(colour: int ) -> void:
	if colour == Colours.RED_TYPE:
		_playerColourAnim("change_To_Red")
#		ColourChangeSoundPlay()
	if colour == Colours.YELLOW_TYPE:
		_playerColourAnim("change_To_Yellow")
#		ColourChangeSoundPlay()
	if colour == Colours.BLUE_TYPE:
		_playerColourAnim("change_To_Blue")
#		ColourChangeSoundPlay()


func ColourChangeSoundPlay () -> void:
	if $ChangeColourSound.playing == false:
			$ChangeColourSound.play()
	pass

func JumpSoundPlay () -> void:
	if $JumpSound.playing == false:
			$JumpSound.play()
	pass

func _playerColourAnim(anim: String) -> void:
	anim_player.play(anim)


func stompImpulse () -> void:
	print("Bounce player, plz")
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)
	return


func waitUntilEnemyDead() -> void:
	get_node("../Enemy_Red").isEnemyDead()


#main function for controlling all physics events
func _physics_process(_delta: float) -> void:
	var is_jump_interupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, speed, direction, is_jump_interupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
		return
		
#	if Input.is_action_just_pressed("jump"):
#		JumpSoundPlay()



#controls player movement
func get_direction() -> Vector2:
		return Vector2(
			Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
		)


#calculates velocity for player movement
func calculate_move_velocity(linear_velocity: Vector2, speed: Vector2, direction: Vector2, is_jump_interupted: bool) -> Vector2:
	var output: = linear_velocity
	output.x = speed.x * direction.x
	output.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		output.y = speed.y * direction.y
	if is_jump_interupted:
		output.y = 0.0
	return output


#calculates velocity for the stomp-bounce
func calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var output: = linear_velocity
	output.y = -impulse
	return output



