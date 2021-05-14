class_name Enemy
extends KinematicBody2D

signal damage

export var speed = 150.0
export var damage = 0.25
var health = 100.0
var target = KinematicBody2D.new() setget set_target


func _process(_delta):
	look_at(target.position)


func _physics_process(delta):
	var dir = position.direction_to(target.position)
	var velocity = dir * speed
	var collision_result = move_and_collide(velocity * delta)
	if collision_result != null:
		emit_signal("damage", collision_result.collider, damage)


func hit(dmg):
	health -= dmg
	print(health)
	if health <= 0:
		queue_free()


func set_target(p_target):
	target = p_target
