extends Label


var time = 0
var timer_on = false

#calls all functions when the game is ready
func _ready() -> void:
	timer_on = true
	
func _process(delta):
	if(timer_on):
		time += delta
		
		var miliseconds = fmod(time,1) * 1000
		var seconds = fmod(time,60)
		var minutes = fmod(time, 60*60) / 60
		
		var time_passed = "%02d : %02d : %03d" % [minutes, seconds, miliseconds]
		text = time_passed # + " : " + var2str(time)
		
	pass
