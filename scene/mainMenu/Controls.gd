extends Control

@onready var engine_sound = $engineSound

func _on_play_tsb_pressed():
	Global.point = 0
	engine_sound.play()
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://scene/main/main.tscn")

func _on_quite_tsb_pressed():
	get_tree().quit()
