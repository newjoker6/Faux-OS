extends Node

var UserData = {
	"User": [],
	"Password": [],
	"Language": []
}


func _ready():
	print(UserData)
	load_data()
	print(UserData)

func save_data():
	var f = File.new()
	f.open(Global.Base_Dir + "System/SystemFiles/Users.dat", f.WRITE)
	f.store_line(to_json(UserData))
	f.close()

func load_data():
	var f = File.new()
	if f.file_exists(Global.Base_Dir + "System/SystemFiles/Users.dat"):
		f.open(Global.Base_Dir + "System/SystemFiles/Users.dat", f.READ)
		UserData = parse_json(f.get_as_text())
		f.close()
