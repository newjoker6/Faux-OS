extends Control



var texture
var app

onready var DesktopIcons = $Desktop/DesktopIcons
onready var Wallpaper = $Desktop/Wallpaper


# Called when the node enters the scene tree for the first time.
func _ready():
	Wallpaper.rect_size = Global.screen_size
	DesktopIcons.rect_size = Global.screen_size
	yield(get_tree().create_timer(1), "timeout")
#	print(OS.get_executable_path()) # Exe location path
	for app in Global.Installed_Apps:
		create_texure("res://%s/icon.png" %app)
		DesktopIcons.add_item(app, texture)

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		OS.window_fullscreen = false


func create_texure(path):
	var img = Image.new()
	img.load(path)
	texture = ImageTexture.new()
	texture.create_from_image(img)

func _on_resolution_sent(resolution):
	yield(get_tree(),"idle_frame")
	get_node("%s Window" %app).get_child(0).get_child(0).size = resolution
	get_node("%s Window" %app).get_child(0).rect_size = resolution
	get_node("%s Window" %app).rect_size = resolution
	get_node("%s Window" %app).get_child(1).rect_size.x = resolution.x
	printt("resolution",resolution)

func open_app(path):
	print(path)
	if app in Running.OpenApps:
		DesktopIcons.unselect_all()
	else:
		var window = Running.Window.instance()
		add_child(window)
		$Window.rect_position = Vector2(Global.screen_size.x/3, Global.screen_size.y/4)
		
		var imported_scene = load(path)
		var import_inst = imported_scene.instance()
		$Window/ViewportContainer/Viewport.add_child(import_inst)
		Running.OpenApps.append(app)


func _on_ItemList_item_activated(index):
	app = DesktopIcons.get_item_text(index)
	DesktopIcons.unselect_all()
	open_app("res://%s/Main.tscn" %app)
	


func _on_DesktopIcons_nothing_selected():
	DesktopIcons.unselect_all()

func _on_close_pressed(appname):
	Running.OpenApps.erase(appname)
	get_node("%s Window" %appname).queue_free()
