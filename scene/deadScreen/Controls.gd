extends Control

@onready var scene_trasition: CanvasLayer = $"../SceneTrasition"

func _on_retry_tsb_pressed():
	scene_trasition.transition()


func _on_menu_tsb_pressed():
	Global.point = 0
	get_tree().change_scene_to_file("res://scene/mainMenu/mainMenu.tscn")


func _on_scene_trasition_transitioned() -> void:
	Global.point = 0
	get_tree().change_scene_to_file("res://scene/main/main.tscn")
	
