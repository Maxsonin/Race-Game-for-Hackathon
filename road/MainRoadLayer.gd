extends ParallaxLayer

@onready var main_road_layer = %MainRoadLayer

var elapsedTime = 0.0
const INITIAL_SPEED = 80.0
const SPEED_INCREASE_RATE = 0.5
const MAX_SPEED = 400.0
var speed = INITIAL_SPEED
var reachedMaxSpeed = false

func _process(delta) -> void:
	if not reachedMaxSpeed:
		elapsedTime += delta
		speed = INITIAL_SPEED + elapsedTime * SPEED_INCREASE_RATE
		if speed >= MAX_SPEED:
			speed = MAX_SPEED
			reachedMaxSpeed = true
	main_road_layer.motion_offset.y += speed * delta
