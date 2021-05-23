class_name Door
extends StaticBody2D


var is_open: bool = false
onready var collider: CollisionShape2D = $Collider 
onready var door_sprite: Polygon2D = $Polygon2D


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		is_open = !is_open
		set_physics_process(true)
		get_tree().set_input_as_handled()


func _physics_process(_delta: float) -> void:
	door_sprite.rotation = PI / 2.0 if is_open else 0.0
	collider.disabled = is_open
	set_physics_process(false)


func _on_InteractiveArea_state_change(p_interact_state: bool):
	set_process_unhandled_input(p_interact_state)
