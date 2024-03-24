extends Control

@onready var engine_sound = $engineSound
@onready var scene_trasition: CanvasLayer = $"../SceneTrasition"

func _on_play_tsb_pressed():
	Global.point = 0
	engine_sound.play()
	await get_tree().create_timer(1.0).timeout
	scene_trasition.transition()
	
	

func _on_quite_tsb_pressed():
	get_tree().quit()


func _on_scene_trasition_transitioned() -> void:
	get_tree().change_scene_to_file("res://scene/main/main.tscn")
