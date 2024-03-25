extends Node2D

var can_move = true

@onready var car_hitbox: Area2D = $CarHitbox
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var point_light_2d_2: PointLight2D = $PointLight2D2

signal car_got_hit_fr()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_move:
		Global.point+=30*delta
	if Global.night:
		point_light_2d.visible = true
		point_light_2d_2.visible = true
	else:
		point_light_2d.visible = false
		point_light_2d_2.visible = false


func _on_car_hitbox_car_got_hit() -> void:
	can_move = false
	car_got_hit_fr.emit()
