extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

signal transitioned

func transition():
	animation_player.play("fade_to_black")

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#transition()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_to_black":
		emit_signal("transitioned")
		animation_player.play_backwards("fade_to_black")
