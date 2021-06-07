extends Label


var hour
var minute
var seconds
var time




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time = OS.get_time(false)
	hour = time.hour
	minute = time.minute
	seconds = time.second
	
	if minute >= 10:
		self.text = str(hour) + ":" + str(minute) + ":" + str(seconds)
		if seconds >= 10:
			 self.text + ":" + str(seconds)
		elif seconds < 10:
			 self.text = str(hour) + ":" + str(minute) + ":0" + str(seconds)
	
	elif minute < 10:
		if seconds >= 10:
			 self.text = str(hour) + ":0" + str(minute) + ":" + str(seconds)
		elif seconds < 10:
			 self.text = str(hour) + ":0"  + str(minute) + ":0" + str(seconds)
