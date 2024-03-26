extends Node2D

@export var CarObstacle: PackedScene
@export var SignObstacle: PackedScene
@export var TaxiObstacle: PackedScene
@export var SemiObstacle: PackedScene
@export var JeepObstacle: PackedScene
@export var PickupObstacle: PackedScene

var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")
var margine = 8
var spawn_points = [32, 64, 96, 128]
var prev_picked_by_random = 0
var prev_prev_picked_by_random = 0
var boo = 0

@onready var spawner: Node2D = $Spawner
@onready var car_obst_timer: Timer = $CarObstTimer
@onready var sign_obst_timer: Timer = $SignObstTimer
@onready var taxi_obst_timer: Timer = $TaxiObstTimer
@onready var semi_obst_timer: Timer = $SemiObstTimer
@onready var jeep_obst_timer: Timer = $JeepObstTimer
@onready var pickup_obst_timer: Timer = $PickupObstTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	car_obst_timer.timeout.connect(spawn_shi.bind(CarObstacle, car_obst_timer))
	sign_obst_timer.timeout.connect(spawn_shi.bind(SignObstacle, sign_obst_timer))
	taxi_obst_timer.timeout.connect(spawn_shi.bind(TaxiObstacle, taxi_obst_timer))
	semi_obst_timer.timeout.connect(spawn_shi.bind(SemiObstacle, semi_obst_timer))
	jeep_obst_timer.timeout.connect(spawn_shi.bind(JeepObstacle, jeep_obst_timer))
	pickup_obst_timer.timeout.connect(spawn_shi.bind(PickupObstacle, pickup_obst_timer))


func _process(delta):
	if int(Global.point) > 0 and int(Global.point) <= 2100 and int(Global.point) % 300 == 0:
		taxi_obst_timer.wait_time /= 1.35
		Global.point+=1
		sign_obst_timer.wait_time /= 1.35


func spawn_shi(obstacle: PackedScene, timer: Timer) -> void:
	spawner.scene = obstacle
	boo = spawn_points.pick_random()
	while boo == prev_picked_by_random:
		if boo == prev_prev_picked_by_random: continue
		boo = spawn_points.pick_random()
	prev_picked_by_random = boo
	prev_prev_picked_by_random = 0
	spawner.spawn(Vector2(boo, -50))
	timer.start()
