extends Control




func _on_RestartButton_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")


func _on_MenuButton_pressed():
	get_tree().change_scene_to_file("res://StartMenu.tscn")
