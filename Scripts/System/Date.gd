extends Label

var date = OS.get_date(false)
var day


func _ready():
	check_day()
	yield(get_tree(),"idle_frame")
	self.text = day + " " + str(date.day) + "/" + str(date.month) + "/"+ str(date.year)


func check_day():
	match date.weekday:
		0:
			day = tr("Sunday")
		1:
			day = tr("Monday")
		2:
			day = tr("Tuesday")
		3:
			day = tr("Wednesday")
		4:
			day = tr("Thursday")
		5:
			day = tr("Friday")
		6:
			day = tr("Saturday")
		7:
			day = tr("Sunday")
