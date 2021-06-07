extends Control

var lang = "en"

func _ready():
	$AnimationPlayer.play("RegistrationFade")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	set_text()


func _on_OptionButton_item_selected(index):
	lang = $Panel/TextContainer/OptionButton.get_item_text(index)
	if lang == "en":
		TranslationServer.set_locale("en")
		set_text()
	if lang == "ru":
		TranslationServer.set_locale("ru")
		set_text()

func set_text():
	$Panel/RegisterUser.text = tr("Register User")
	$Panel/LabelContainer/Language.text = tr("Select Preferred Language")
	$Panel/LabelContainer/Username.text = tr("Desired Username")
	$Panel/LabelContainer/Password.text = tr("Password")
	$Panel/OkButton.text = tr("Continue")
	$Panel/TextContainer/Username.placeholder_text = tr("Username")
	$Panel/TextContainer/Password.placeholder_text = tr("Password")


func _on_OkButton_pressed():
	if $Panel/TextContainer/Username.text == "" or $Panel/TextContainer/Password.text == "":
		print("field empty")
	elif !$Panel/TextContainer/Username.text == "" and !$Panel/TextContainer/Password.text == "":
		UserData.UserData.User.append($Panel/TextContainer/Username.text)
		UserData.UserData.Password.append($Panel/TextContainer/Password.text)
		UserData.UserData.Language.append(lang)
		print(UserData.UserData)
		UserData.save_data()
		get_tree().change_scene("res://Desktop.tscn")
