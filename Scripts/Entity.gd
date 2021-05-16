class_name Entity
extends Area2D


export var tile_size: int = 32
onready var sprite: Sprite = $Sprite
onready var ray_up: RayCast2D = $RayCasts/Up
onready var ray_down: RayCast2D = $RayCasts/Down
onready var ray_left: RayCast2D = $RayCasts/Left
onready var ray_right: RayCast2D = $RayCasts/Right

var _direction := Vector2.ZERO

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up") && !ray_up.is_colliding():
		_direction += Vector2.UP
	if event.is_action_pressed("ui_down") && !ray_down.is_colliding():
		_direction += Vector2.DOWN
	if event.is_action_pressed("ui_left") && !ray_left.is_colliding():
		_direction += Vector2.LEFT
		sprite.scale.x = abs(sprite.scale.x)
	if event.is_action_pressed("ui_right") && !ray_right.is_colliding():
		_direction += Vector2.RIGHT
		sprite.scale.x = -abs(sprite.scale.x)
	set_physics_process(true)


func _physics_process(_delta: float) -> void:
	position += _direction * tile_size
	_direction = Vector2.ZERO
	set_physics_process(false)
