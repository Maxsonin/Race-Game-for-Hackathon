extends Control

@onready var engine_sound = %engineSound
@onready var scene_trasition: CanvasLayer = $"../SceneTrasition"

var changing_to_store = false

func _on_play_tsb_pressed():
	Global.point = 0
	engine_sound.play()
	await get_tree().create_timer(1.0).timeout
	scene_trasition.transition()


func _on_quite_tsb_pressed():
	get_tree().quit()


func _on_scene_trasition_transitioned() -> void:
	if changing_to_store:
		get_tree().change_scene_to_file("res://scene/garage/garage.tscn")
	else:
		get_tree().change_scene_to_file("res://scene/main/main.tscn")


func _on_store_tsb_pressed():
	changing_to_store = true
	scene_trasition.transition()
	
