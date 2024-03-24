extends Node

@onready var car = $Car

const VALUE_NEEDED_TO_CHANGE_ROAD = 32
const TIME_NEEDED_TO_CHANGE_ROAD = 1

var target_position_x: float = 0
var target_rotation: float = 0

var move_speed: float = 0
var rotate_speed: float = 0

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("MoveRight") and car.position.x < 120:
		target_position_x = car.position.x + VALUE_NEEDED_TO_CHANGE_ROAD
		move_speed = (VALUE_NEEDED_TO_CHANGE_ROAD / TIME_NEEDED_TO_CHANGE_ROAD)
		target_rotation = 15
		rotate_speed = (15 / TIME_NEEDED_TO_CHANGE_ROAD)
	elif Input.is_action_just_pressed("MoveLeft") and car.position.x > 62:
		target_position_x = car.position.x - VALUE_NEEDED_TO_CHANGE_ROAD
		move_speed = (VALUE_NEEDED_TO_CHANGE_ROAD / TIME_NEEDED_TO_CHANGE_ROAD)
		target_rotation = -15
		rotate_speed = (15 / TIME_NEEDED_TO_CHANGE_ROAD)

	if move_speed > 0:
		car.position.x = lerp(car.position.x, target_position_x, move_speed * delta)
		car.rotation_degrees = lerp(car.rotation_degrees, target_rotation, rotate_speed * delta)

		# Check if the car has reached the target rotation
		if abs(car.rotation_degrees - target_rotation) < 1.0:
			# Reset target rotation and position
			target_rotation = 0
			target_position_x = car.position.x  # You may need to adjust this depending on your game logic
			move_speed = (VALUE_NEEDED_TO_CHANGE_ROAD / TIME_NEEDED_TO_CHANGE_ROAD)  # Reset move speed as well
