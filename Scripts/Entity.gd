class_name Entity
extends KinematicBody2D


export var speed: float = 100.0

onready var sprite: Sprite = $Sprite
var _direction := Vector2.ZERO


func _process(_delta: float) -> void:
	if _direction.x > 0:
		sprite.scale.x = abs(sprite.scale.x)
	elif _direction.x < 0:
		sprite.scale.x = -abs(sprite.scale.x)


func _physics_process(_delta: float) -> void:
	_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		_direction += Vector2.UP
	if Input.is_action_pressed("ui_down"):
		_direction += Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		_direction += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		_direction += Vector2.RIGHT
	var new_velocity: Vector2 = _direction.normalized() * speed
	move_and_slide(new_velocity)
