extends Label

var time = 0
var timer_on = false

#Timer starts and counts when "timer_on" is "true"
func _process(delta):
	if(timer_on):
		time += delta
		
		var miliseconds = fmod(time,1) * 1000
		var seconds = fmod(time,60)
		var minutes = fmod(time, 60*60) / 60
		
		var time_passed = "%02d : %02d : %03d" % [minutes, seconds, miliseconds]
		text = time_passed # + " : " + var2str(time)
		
	pass



#When Start Button is pressed
func _on_Button_Start_pressed():
	timer_on = true
	pass # Replace with function body.

#When Stop Button is pressed
func _on_Button_Stop_pressed():
	timer_on = false
	pass # Replace with function body.

#when Reset Button is pressed
func _on_Button_Reset_pressed():
	time = 0
	set_text("00 : 00 : 000")
	pass # Replace with function body.
