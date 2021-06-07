extends Control



var following = false
var dragging_start_position = Vector2()
var appname
var texture

signal Close_Window


func _ready():
	self.rect_size = Vector2(955,1024)
	self.connect("Close_Window", get_tree().get_root().get_node("OS"), "_on_close_pressed")
	yield(get_tree(),"idle_frame")
	appname = Running.OpenApps.back()
	self.name = "%s Window" %appname
	yield(get_tree(),"idle_frame")
	$GuiTitleBar/HBoxContainer/AppName.text = appname
	yield(get_tree(),"idle_frame")
	create_texure("res://%s/icon.png" %appname)
	$GuiTitleBar/HBoxContainer/AppIcon.texture = texture
	$GuiTitleBar/HBoxContainer/AppIcon.rect_size = Vector2(20,20)


func _on_GuiTitleBar_gui_input(event):
#	print(self.rect_position)
	if event.is_action_pressed("MouseLeft"):
		following = true
		dragging_start_position = get_local_mouse_position()
	if event.is_action_released("MouseLeft"):
		following = false



func _process(_delta):
	if following == true:
#		print(self.rect_position)
		self.rect_position = self.rect_position + get_local_mouse_position() - dragging_start_position



func _on_Close_pressed():
	get_tree().quit()


func create_texure(path):
	var img = Image.new()
	img.load(path)
	texture = ImageTexture.new()
	texture.create_from_image(img)

func _on_Maxamize_pressed():
	if OS.window_maximized == true:
		OS.window_maximized = false
	else:
		OS.window_maximized = true



func _on_Minimize_pressed():
	OS.window_minimized = true



func _on_Button_pressed():
	emit_signal("Close_Window", appname)
