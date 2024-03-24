extends Node2D

@export var CarObstacle: PackedScene
@export var SignObstacle: PackedScene

var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")
var margine = 8
var spawn_points = [35, 65, 95, 125]
var prev_picked_by_random = 0
var boo = 0

@onready var spawner: Node2D = $Spawner
@onready var car_obst_timer: Timer = $CarObstTimer
@onready var sign_obst_timer: Timer = $SignObstTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	car_obst_timer.timeout.connect(spawn_shi.bind(CarObstacle, car_obst_timer))
	sign_obst_timer.timeout.connect(spawn_shi.bind(SignObstacle, sign_obst_timer))


func _process(delta):
	if int(Global.point) > 0 and int(Global.point) <= 1500 and int(Global.point) % 300 == 0:
		car_obst_timer.wait_time /= 1.25
		sign_obst_timer.wait_time /= 1.25


func spawn_shi(obstacle: PackedScene, timer: Timer) -> void:
	spawner.scene = obstacle
	boo = spawn_points.pick_random()
	while boo == prev_picked_by_random:
		boo = spawn_points.pick_random()
	prev_picked_by_random = boo
	spawner.spawn(Vector2(boo, -30))
	timer.start()
