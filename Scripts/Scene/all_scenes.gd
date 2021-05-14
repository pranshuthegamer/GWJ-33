extends Node2D

onready var player = Auto.character
onready var enemy = get_node("Enemy")


func _ready() -> void:
	enemy.connect("damage", self, "_on_Enemy_damage")
	enemy.set_target(player)


func _on_Enemy_damage(p_collider, p_damage):
	p_collider.hit(p_damage)
