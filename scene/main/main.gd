extends Node

@onready var constant_engine_sound = %constantEngineSound
@onready var night=$night
@onready var pause_menu = %PauseMenu
var paused = false

@onready var scene_trasition: CanvasLayer = $SceneTrasition

@onready var turn_anim = %turnAnim
@onready var car = $Car
const VALUE_NEEDED_TO_CHANGE_ROAD = 32
const TIME_NEEDED_TO_CHANGE_ROAD = 1
var target_position_x: float = 96
var move_speed: float = (VALUE_NEEDED_TO_CHANGE_ROAD / TIME_NEEDED_TO_CHANGE_ROAD)
var targetPositions := [32, 64, 96, 128]
var pos = 1

func _ready():
	pass

func _process(delta):
	if (int(Global.point)%1000==0):
		Global.point+=1
		print("night")
		night.visible=!night.visible
	if Input.is_action_just_pressed("Pause"):
		pauseManu()

	elif Input.is_action_just_pressed("MoveRight") and pos < 2:
		if not car.can_move: return
		turn_anim.play("turn_right")
		pos += 1

	elif Input.is_action_just_pressed("MoveLeft") and pos > -1:
		if not car.can_move: return
		turn_anim.play("turn_left")
		pos -= 1

	setPosition()
	car.position.x = lerp(car.position.x, target_position_x, move_speed * delta)


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

func setPosition():
	if pos == -1:
		target_position_x = targetPositions[0]
	elif pos == 0:
		target_position_x = targetPositions[1]
	elif pos == 1:
		target_position_x = targetPositions[2]
	elif pos == 2:
		target_position_x = targetPositions[3]
