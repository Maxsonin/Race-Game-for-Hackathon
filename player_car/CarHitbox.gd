extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(_on_body_entered)

func _on_body_entered(body: Area2D):
	print("Collision detected")
	if body.has_method("get_name"):
		print(body.get_parent().get_node("MoveComponent").speed)
		var body_name = body.get_name()
		print("Collided with:", body_name)
		body.get_parent().get_node("MoveComponent").reachedMaxSpeed=true
		body.get_parent().get_node("MoveComponent").speed = 0.0
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
