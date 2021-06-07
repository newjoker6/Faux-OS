extends Control



func _ready():
	$Username.placeholder_text = tr("Username")
	$Password.placeholder_text = tr("Password")
	$LoginButton.text = tr("Login")
	$AnimationPlayer.play("LoginFade")


func _on_AnimationPlayer_animation_finished(anim_name):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_LoginButton_pressed():
	if !$Username.text == "" and !$Password.text == "":
		if $Username.text in UserData.UserData.User:
			var user_index = UserData.UserData.User.find($Username.text)
			if UserData.UserData.Password[user_index] == $Password.text:
				TranslationServer.set_locale(UserData.UserData.Language[user_index])
				get_tree().change_scene("res://Desktop.tscn")
