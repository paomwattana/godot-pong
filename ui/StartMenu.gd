extends Control


func _ready():
	pass

func _on_PlayButton_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_tutorial_button_pressed():
	# hide menu
	$GameMenu.hide()
	
	# show tutorial image and back button
	$Tutorial.show()


func _on_back_button_pressed():
	# show menu
	$GameMenu.show()
	
	# hide tutorial image and back button
	$Tutorial.hide()
