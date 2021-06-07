extends Control


func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$AnimationPlayer.play("Boot")


func _on_AnimationPlayer_animation_finished(anim_name):
	if UserData.UserData["User"].size() <= 0:
		get_tree().change_scene("res://RegisterScene.tscn")
	else:
		get_tree().change_scene("res://LoginScreen.tscn")
