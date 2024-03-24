extends Node2D

@export var CarObstacle: PackedScene
@export var SignObstacle: PackedScene

var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")
var margine = 8
var spawn_points = [35, 65, 95, 125]

@onready var spawner: Node2D = $Spawner
@onready var car_obst_timer: Timer = $CarObstTimer
@onready var sign_obst_timer: Timer = $SignObstTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	car_obst_timer.timeout.connect(spawn_shi.bind(CarObstacle, car_obst_timer))
	sign_obst_timer.timeout.connect(spawn_shi.bind(SignObstacle, sign_obst_timer))

func spawn_shi(obstacle: PackedScene, timer: Timer) -> void:
	spawner.scene = obstacle
	spawner.spawn(Vector2(spawn_points.pick_random(), -30))
	timer.start()
