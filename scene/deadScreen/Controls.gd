extends Control

func _on_retry_tsb_pressed():
	get_tree().change_scene_to_file("res://scene/main/main.tscn")


func _on_menu_tsb_pressed():
	get_tree().change_scene_to_file("res://scene/mainMenu/mainMenu.tscn")
