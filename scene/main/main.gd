extends Node

@onready var car = $Car
@onready var pause_menu = %PauseMenu

var paused = false

const VALUE_NEEDED_TO_CHANGE_ROAD = 32
const TIME_NEEDED_TO_CHANGE_ROAD = 1

var target_position_x: float = 0
var target_rotation: float = 0

var move_speed: float = 0
var rotate_speed: float = 0

var dead_wait = false

func _ready():
	pass


func wait_and_die():
	if not dead_wait:
		await get_tree().create_timer(1).timeout
		dead_wait = true
	get_tree().change_scene_to_file("res://scene/deadScreen/dead_scene.tscn")


func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		pauseManu()
	elif Input.is_action_just_pressed("MoveRight") and car.position.x < 120:
		if not car.can_move:
			wait_and_die()
			return
		target_position_x = car.position.x + VALUE_NEEDED_TO_CHANGE_ROAD
		move_speed = (VALUE_NEEDED_TO_CHANGE_ROAD / TIME_NEEDED_TO_CHANGE_ROAD)
		target_rotation = 15
		rotate_speed = (15 / TIME_NEEDED_TO_CHANGE_ROAD)
	elif Input.is_action_just_pressed("MoveLeft") and car.position.x > 62:
		if not car.can_move:
			wait_and_die()
			return
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

func pauseManu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused
