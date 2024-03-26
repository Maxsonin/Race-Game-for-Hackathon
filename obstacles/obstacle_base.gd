extends Node2D

@onready var left_light: PointLight2D = $LeftLight
@onready var right_light: PointLight2D = $RightLight


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.night:
		left_light.visible = true
		right_light.visible = true
	else:
		left_light.visible = false
		right_light.visible = false
