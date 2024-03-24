extends TouchScreenButton


func _on_pressed():
	Global.point = 0
	get_tree().change_scene_to_file("res://scene/main/main.tscn")
