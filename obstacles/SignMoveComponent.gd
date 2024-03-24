extends MoveComponent

var _elapsedTime = 0.0
const _INITIAL_SPEED = 80.0
const _SPEED_INCREASE_RATE = 0.5
const _MAX_SPEED = 400.0
var _speed = _INITIAL_SPEED
var _reachedMaxSpeed = false

func _process(delta) -> void:
	if not reachedMaxSpeed:
		_elapsedTime += delta
		_speed = _INITIAL_SPEED + _elapsedTime * _SPEED_INCREASE_RATE
		if _speed >= _MAX_SPEED:
			_speed = _MAX_SPEED
			_reachedMaxSpeed = true
	actor.position.y += _speed * delta
