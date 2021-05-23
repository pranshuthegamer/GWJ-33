class_name InteractiveArea
extends Area2D


signal state_change


func _on_InteractiveArea_area_entered(_area: Area2D) -> void:
	emit_signal("state_change", true)


func _on_InteractiveArea_area_exited(_area: Area2D) -> void:
	emit_signal("state_change", false)


func _on_InteractiveArea_body_entered(_body: PhysicsBody2D) -> void:
	emit_signal("state_change", true)


func _on_InteractiveArea_body_exited(_body: PhysicsBody2D) -> void:
	emit_signal("state_change", false)
