extends TextureButton

var menu = preload("res://OSMenu.tscn")


func _on_OSButton_toggled(button_pressed):
	if button_pressed:
		var menu_inst = menu.instance()
		menu_inst.rect_position.y += 40
		self.add_child(menu_inst)
	if !button_pressed:
		var children = self.get_children()
		for child in children:
			if "OSMenu" in child.name:
				print("GOT EEM")
				$OSMenu.queue_free()
