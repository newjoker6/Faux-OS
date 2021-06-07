extends ItemList


onready var Desktop = get_parent().get_parent().get_parent()
var SystemInfoScene = preload("res://SystemInfo.tscn")

signal OpenSystemApp


# Called when the node enters the scene tree for the first time.
func _ready():
	additems()
	

func _on_OSMenu_item_activated(index):
	var item = self.get_item_text(index)
	

	if item == tr("System Information"):
		get_parent().pressed = false
		print("clicked")
		print(Running.OpenApps)
		if "System Information" in Running.OpenApps:
			print("Already Running")
		else:
			Running.OpenApps.append("System Information")
			var Info_Inst = SystemInfoScene.instance()
			Info_Inst.rect_position = Vector2(Global.screen_size.x/2.5, Global.screen_size.y/2.5)
			Desktop.add_child(Info_Inst)

	elif item == tr("Quit"):
		get_tree().quit()
	self.unselect_all()

func additems():
	for item in Running.SystemMenuItems:
		self.add_item(tr(item))
		
