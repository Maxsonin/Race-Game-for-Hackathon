extends Control

@onready var scene_trasition: CanvasLayer = $"../SceneTrasition"

var retrying = true

func _on_retry_tsb_pressed():
	scene_trasition.transition()


func _on_menu_tsb_pressed():
	retrying = false
	scene_trasition.transition()


func _on_scene_trasition_transitioned() -> void:
	Global.point = 0
	if retrying:
		get_tree().change_scene_to_file("res://scene/main/main.tscn")
	else:
		get_tree().change_scene_to_file("res://scene/mainMenu/mainMenu.tscn")
