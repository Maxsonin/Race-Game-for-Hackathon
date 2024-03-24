extends Node2D

var can_move = true

@onready var car_hitbox: Area2D = $CarHitbox

signal car_got_hit_fr()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_move:
		Global.point+=30*delta


func _on_car_hitbox_car_got_hit() -> void:
	can_move = false
	car_got_hit_fr.emit()
