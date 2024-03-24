extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	print("Collision detected")
	if body.has_method("get_name"):
		var body_name = body.get_name()
		print("Collided with:", body_name)
