extends Node

@onready var constant_engine_sound = %constantEngineSound

@onready var pause_menu = %PauseMenu
var paused = false

@onready var scene_trasition: CanvasLayer = $SceneTrasition

@onready var turn_anim = %turnAnim
@onready var car = $Car
const VALUE_NEEDED_TO_CHANGE_ROAD = 32
const TIME_NEEDED_TO_CHANGE_ROAD = 1
var target_position_x: float = 0
var move_speed: float = 0

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		pauseManu()

	elif Input.is_action_just_pressed("MoveRight") and car.position.x < 120:
		if not car.can_move: return
		turn_anim.play("turn_right")
		target_position_x = car.position.x + VALUE_NEEDED_TO_CHANGE_ROAD
		move_speed = (VALUE_NEEDED_TO_CHANGE_ROAD / TIME_NEEDED_TO_CHANGE_ROAD)

	elif Input.is_action_just_pressed("MoveLeft") and car.position.x > 62:
		if not car.can_move: return
		turn_anim.play("turn_left")
		target_position_x = car.position.x - VALUE_NEEDED_TO_CHANGE_ROAD
		move_speed = (VALUE_NEEDED_TO_CHANGE_ROAD / TIME_NEEDED_TO_CHANGE_ROAD)

	if move_speed > 0:
		car.position.x = lerp(car.position.x, target_position_x, move_speed * delta)
		
	if move_speed == 0:
		target_position_x = car.position.x 
		move_speed = (VALUE_NEEDED_TO_CHANGE_ROAD / TIME_NEEDED_TO_CHANGE_ROAD)
		corig()

func pauseManu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
		constant_engine_sound.play()
	else:
		pause_menu.show()
		Engine.time_scale = 0
		constant_engine_sound.stop()
	
	paused = !paused

func _on_car_car_got_hit_fr() -> void:
	await get_tree().create_timer(1).timeout
	scene_trasition.transition()
	#get_tree().change_scene_to_file("res://scene/deadScreen/dead_scene.tscn")

func _on_scene_trasition_transitioned() -> void:
	get_tree().change_scene_to_file("res://scene/deadScreen/dead_scene.tscn")

func corig():
	if car.position.x > 133 and car.position.x>113:
		car.position.x = 128
		
	if car.position.x > 27 and car.position.x <= 57:
		car.position.x = 32
		
	if car.position.x > 57 and car.position.x <= 80:
		car.position.x = 63
		
	if car.position.x > 80 and car.position.x <= 113:
		car.position.x=96
