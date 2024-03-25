extends Area2D

@onready var move_component: MoveComponent = $"../MoveComponent"

@onready var crash_sound = %crashSound

signal car_got_hit()

# Called when the node enters the scene tree for the first time.
func _ready():
	move_component.speed = 0.0
	move_component.reachedMaxSpeed = true
	area_entered.connect(_on_body_entered)

func _on_body_entered(body: Area2D):
	if body.has_method("get_name"):
		var body_name = body.get_name()
		crash_sound.play()
		if body.get_parent().has_node("MoveComponent"):
			move_component.speed = body.get_parent().get_node("MoveComponent").speed
		else:
			move_component.speed = body.get_parent().get_node("SignMoveComponent")._speed
		car_got_hit.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
