extends Control

@onready var main = $"../../../"

func _on_manu_tsb_pressed():
	main.pauseManu()
	get_tree().change_scene_to_file("res://scene/mainMenu/mainMenu.tscn")
