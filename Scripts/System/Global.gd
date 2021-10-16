extends Node


var App_Name = ProjectSettings.get_setting("application/config/name")
var App_Dir = OS.get_executable_path().replace("%s.exe" %App_Name, "")
#var App_Dir = "E:/PCUSER/Documents/AppDev/OS/Operating System.exe".replace("%s.exe" %App_Name, "System/Applications/")
var Base_Dir = "E:/PCUSER/Documents/AppDev/OS/Operating System.exe".replace("%s.exe" %App_Name, "")

var screen_size = OS.get_screen_size()

var Installed_Apps = []


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.window_fullscreen = true
	create_folders(Base_Dir)
	yield(get_tree(),"idle_frame")
	Add_Apps(App_Dir)
	yield(get_tree(),"idle_frame")
	for app in Installed_Apps:
		ProjectSettings.load_resource_pack("E:/PCUSER/Documents/AppDev/OS/System/Applications/%s.pck" %app)


func create_folders(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.make_dir("System")
	path = path + "/System"
	if dir.open(path) == OK:
		dir.make_dir("Wallpaper")
		dir.make_dir("Applications")
		dir.make_dir("SystemFiles")


func Add_Apps(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
			else:
				if file_name.get_extension().to_lower() == "pck":
					file_name = file_name.replace(".pck","")
					Installed_Apps.append(file_name)
			file_name = dir.get_next()
